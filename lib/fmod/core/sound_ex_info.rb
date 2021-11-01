module FMOD
  module Core

    ##
    # Use this structure with FMOD::System.create_sound or
    # FMOD::System.create_stream when more control is needed over loading.
    class SoundExInfo < Structure

      # @param address [Pointer, Integer, String, nil] The address in memory
      #   where the structure will be created from. If no address is given, new
      #   memory will be allocated.
      def initialize(address = nil)
        types = [
          TYPE_INT, TYPE_INT, TYPE_INT, TYPE_INT, TYPE_INT, TYPE_INT, TYPE_INT,
          TYPE_INT, TYPE_INT, TYPE_INT, TYPE_INT, TYPE_INT, TYPE_INT,
          TYPE_VOIDP, TYPE_VOIDP, TYPE_VOIDP, TYPE_CHAR, TYPE_CHAR, TYPE_INT,
          TYPE_VOIDP, TYPE_INT, TYPE_VOIDP, TYPE_VOIDP, TYPE_VOIDP, TYPE_VOIDP,
          TYPE_VOIDP, TYPE_VOIDP, TYPE_VOIDP, TYPE_INT, TYPE_INT, TYPE_INT,
          TYPE_INT, TYPE_INT, TYPE_INT, TYPE_INT, TYPE_VOIDP
        ]
        members = [
          :cbsize, :length, :fileoffset, :numchannels, :defaultfrequency,
          :format, :decodebuffersize, :initialsubsound, :numsubsounds,
          :inclusionlist, :inclusionlistnum, :pcmreadcallback,
          :pcmsetposcallback, :nonblockcallback, :dlsname, :encryptionkey,
          :maxpolyphony, :userdata, :suggestedsoundtype, :fileuseropen,
          :fileuserclose, :fileuserread, :fileuserseek, :fileuserasyncread,
          :fileuserasynccancel, :fileuserdata, :filebuffersize, :channelorder,
          :initialsoundgroup, :initialseekposition, :initialseekpostype,
          :ignoresetfilesystem, :audioqueuepolicy, :minmidigranularity,
          :nonblockthreadid, :fsbguid
        ]
        super(address, types, members)
      end

      [
        :cbsize, :length, :fileoffset, :numchannels, :defaultfrequency,
        :format, :decodebuffersize, :initialsubsound, :numsubsounds,
        :inclusionlist, :inclusionlistnum, :pcmreadcallback,
        :pcmsetposcallback, :nonblockcallback, :dlsname, :encryptionkey,
        :maxpolyphony, :userdata, :suggestedsoundtype, :fileuseropen,
        :fileuserclose, :fileuserread, :fileuserseek, :fileuserasyncread,
        :fileuserasynccancel, :fileuserdata, :filebuffersize, :channelorder,
        :initialsoundgroup, :initialseekposition, :initialseekpostype,
        :ignoresetfilesystem, :audioqueuepolicy, :minmidigranularity,
        :nonblockthreadid, :fsbguid
      ].each do |sym|
        define_method(sym) { self[sym] }
        define_method("#{sym}=") { |value| self[sym] = value }
      end

      def cbsize
        self[:cbsize]
      end

      def cbsize=(size)
        self[:cbsize] = size
      end

      def length
        self[:length]
      end

      def length=(length)
        self[:length] = length
      end

      def suggested_sound_type
        self[:suggestedsoundtype]
      end

      def suggested_sound_type=(type)
        self[:suggestedsoundtype] = type
      end

      def file_buffer_size
        self[:filebuffersize]
      end

      def file_buffer_size=(size)
        self[:filebuffersize] = size
      end
    end
  end
end