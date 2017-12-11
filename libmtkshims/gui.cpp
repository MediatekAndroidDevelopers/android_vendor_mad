#include <gui/BufferQueue.h>

extern "C" {
  
    void _ZN7android11BufferQueue17createBufferQueueEPNS_2spINS_22IGraphicBufferProducerEEEPNS1_INS_22IGraphicBufferConsumerEEEb(android::sp<android::IGraphicBufferProducer>*, android::sp<android::IGraphicBufferConsumer>*, bool);
    void _ZN7android11BufferQueue17createBufferQueueEPNS_2spINS_22IGraphicBufferProducerEEEPNS1_INS_22IGraphicBufferConsumerEEERKNS1_INS_19IGraphicBufferAllocEEE(android::sp<android::IGraphicBufferProducer>*, android::sp<android::IGraphicBufferConsumer>*);
  
    void _ZN7android11BufferQueue17createBufferQueueEPNS_2spINS_22IGraphicBufferProducerEEEPNS1_INS_22IGraphicBufferConsumerEEERKNS1_INS_19IGraphicBufferAllocEEE(android::sp<android::IGraphicBufferProducer>* outProducer, android::sp<android::IGraphicBufferConsumer>* outConsumer) {
        _ZN7android11BufferQueue17createBufferQueueEPNS_2spINS_22IGraphicBufferProducerEEEPNS1_INS_22IGraphicBufferConsumerEEEb(outProducer, outConsumer, false);
    }

#ifdef __LP64__
    void _ZN7android18BufferItemConsumerC2ERKNS_2spINS_22IGraphicBufferConsumerEEEmib(const android::sp<android::IGraphicBufferConsumer>&, uint64_t, int, bool);

    void _ZN7android18BufferItemConsumerC1ERKNS_2spINS_22IGraphicBufferConsumerEEEjib(const android::sp<android::IGraphicBufferConsumer>& consumer, uint32_t consumerUsage, int bufferCount, bool controlledByApp) {
        _ZN7android18BufferItemConsumerC2ERKNS_2spINS_22IGraphicBufferConsumerEEEmib(consumer, static_cast<uint64_t>(consumerUsage), bufferCount, controlledByApp);
    }
#else
    void _ZN7android18BufferItemConsumerC2ERKNS_2spINS_22IGraphicBufferConsumerEEEyib(const android::sp<android::IGraphicBufferConsumer>&, uint64_t, int, bool);

    void _ZN7android18BufferItemConsumerC1ERKNS_2spINS_22IGraphicBufferConsumerEEEjib(const android::sp<android::IGraphicBufferConsumer>& consumer, uint32_t consumerUsage, int bufferCount, bool controlledByApp) {
        _ZN7android18BufferItemConsumerC2ERKNS_2spINS_22IGraphicBufferConsumerEEEyib(consumer, static_cast<uint64_t>(consumerUsage), bufferCount, controlledByApp);
    }
#endif
}
