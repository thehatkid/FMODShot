module FMOD
  module Core
    class AdvancedSettings < Structure

      def initialize(address = nil)
        types = [
          TYPE_INT, TYPE_INT, TYPE_INT, TYPE_INT, TYPE_INT, TYPE_INT,
          TYPE_INT, TYPE_INT, TYPE_INT, TYPE_CHAR, TYPE_VOIDP,
          TYPE_FLOAT, TYPE_INT, TYPE_SHORT, TYPE_INT, TYPE_FLOAT, TYPE_INT,
          TYPE_INT, TYPE_INT, TYPE_INT, TYPE_INT, TYPE_VOIDP, TYPE_INT,
          TYPE_INT, TYPE_INT
        ]
        members = [
          :cbSize, :maxMPEGCodecs, :maxADPCMCodecs, :maxXMACodecs,
          :maxVorbisCodecs, :maxAT9Codecs, :maxFADPCMCodecs, :maxPCMCodecs,
          :ASIONumChannels, :ASIOChannelList, :ASIOSpeakerList, :vol0virtualvol,
          :defaultDecodeBufferSize, :profilePort, :geometryMaxFadeTime,
          :distanceFilterCenterFreq, :reverb3Dinstance, :DSPBufferPoolSize,
          :stackSizeStream, :stackSizeNonBlocking, :stackSizeMixer,
          :resamplerMethod, :commandQueueSize, :randomSeed, :maxOpusCodecs
        ]
        super(address, types, members)
      end

      [
        :cbSize, :maxMPEGCodecs, :maxADPCMCodecs, :maxXMACodecs,
        :maxVorbisCodecs, :maxAT9Codecs, :maxFADPCMCodecs, :maxPCMCodecs,
        :ASIONumChannels, :ASIOChannelList, :ASIOSpeakerList, :vol0virtualvol,
        :defaultDecodeBufferSize, :profilePort, :geometryMaxFadeTime,
        :distanceFilterCenterFreq, :reverb3Dinstance, :DSPBufferPoolSize,
        :stackSizeStream, :stackSizeNonBlocking, :stackSizeMixer,
        :resamplerMethod, :commandQueueSize, :randomSeed, :maxOpusCodecs
      ].each do |sym|
        define_method(sym) { self[sym] }
        define_method("#{sym}=") { |value| self[sym] = value }
      end

      def cbsize=(value)
        self[:cbSize] = value
      end

      def profile_port=(value)
        self[:profilePort] = value
      end
    end
  end
end