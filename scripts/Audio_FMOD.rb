#==============================================================================
# ** Audio_FMOD
#------------------------------------------------------------------------------
#  The module that carries out music and sound processing of FMOD Engine.
#==============================================================================

require 'fmod'

module Audio
  module_function

  FMOD.load_library # Load FMOD engine library

  @fmod = FMOD::System.create()
  @bgm_group = @fmod.create_channel_group('BGM')
  @se_group = @fmod.create_channel_group('SE')
  @reverb = FMOD::Core::Reverb
  @dsp = @fmod.create_dsp(FMOD::Core::DspType::MULTIBAND_EQ)
  @dsp.set_integer(0, 3)   # DSP Multiband EQ: A: Filter (LP 48dB)
  @dsp.set_float(1, 800.0) # DSP Multiband EQ: A: Frequency (800 Hz)
  @dsp.set_float(2, 1.0)   # DSP Multiband EQ: A: Q

  def debug
    bgm_channels = 0
    se_channels = 0
    @bgm_group.map { |n| bgm_channels += 1 }
    @se_group.map { |n| se_channels += 1 }
    print "[FMOD] BGM Channels: #{bgm_channels} | SE Channels: #{se_channels} | CPU Usage: #{@fmod.cpu_usage.total.round(3)}"
  end

  def bgm_play(filename, volume = 100.0, pitch = 100)
    unless @bgm
      @bgm_old = filename
      @bgm = @fmod.create_stream(Dir.glob(filename + '*')[0], {:mode => FMOD::Core::Mode::LOOP_NORMAL}).play(@bgm_group)
    else
      if @bgm_old != filename
        bgm_stop
        @bgm_old = filename
        @bgm = @fmod.create_stream(Dir.glob(filename + '*')[0], {:mode => FMOD::Core::Mode::LOOP_NORMAL}).play(@bgm_group)
      end
    end
    @bgm.priority = 232
    @bgm.volume = volume.to_f / 100
    @bgm.pitch = pitch.to_f / 100
  end

  def bgm_stop
    return unless @bgm
    @bgm.release
    @bgm.stop
    @bgm_old = nil
  end

  def bgm_fade(time)
    return false unless @bgm
    Thread.new {
      incs = @bgm.volume / time
      until @bgm.volume <= 0
        @bgm.volume -= incs
        sleep 0.00075
      end
      bgm_stop
    }
  end

  def se_play(filename, volume = 100, pitch = 100)
    @se = @fmod.create_sound(Dir.glob(filename + '*')[0]).play(@se_group)
    @se.volume = volume.to_f / 100
    @se.pitch = pitch.to_f / 100
    @se.loop_count = 0
  end

  def se_stop
    @se_group.stop
  end

  def reverb_on
    @fmod.set_reverb(0, @reverb.cave)
  end

  def reverb_off
    @fmod.set_reverb(0, @reverb.off)
  end

  def dsp_on
    return false unless @bgm
    @bgm.dsps[0] = @dsp
  end
end