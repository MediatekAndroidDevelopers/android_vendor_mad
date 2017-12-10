#include <binder/IBinder.h>
#include <nativebase/nativebase.h>
#include <ui/GraphicBufferMapper.h>
#include <ui/Rect.h>

extern "C" {
    void _ZN7android19GraphicBufferMapper4lockEPK13native_handlejRKNS_4RectEPPv(buffer_handle_t, uint32_t, const android::Rect&, void**);

    void _ZN7android19GraphicBufferMapper4lockEPK13native_handleiRKNS_4RectEPPv(buffer_handle_t handle, int usage, const android::Rect& bounds, void** vaddr) {
        _ZN7android19GraphicBufferMapper4lockEPK13native_handlejRKNS_4RectEPPv(handle, static_cast<uint32_t>(usage), bounds, vaddr);
    }

    void _ZN7android11IDumpTunnel11asInterfaceERKNS_2spINS_7IBinderEEE(const android::sp<android::IBinder>&) {}

    void _ZN7android13GraphicBufferC1EjjijNSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEE(uint32_t, uint32_t, int32_t, uint32_t, std::string);

    void _ZN7android13GraphicBufferC1Ejjij(uint32_t inWidth, uint32_t inHeight, int32_t inFormat, uint32_t inUsage) {
        _ZN7android13GraphicBufferC1EjjijNSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEE(inWidth, inHeight, inFormat, inUsage, "<Unknown>");
    }

    void _ZN7android13GraphicBufferC1EjjijjjP13native_handleb(uint32_t, uint32_t, int32_t, uint32_t, uint32_t, uint32_t, native_handle_t*, bool);

    void _ZN7android13GraphicBufferC1EjjijjP13native_handleb(uint32_t inWidth, uint32_t inHeight, int32_t inFormat, uint32_t inUsage, uint32_t inStride, native_handle_t* inHandle, bool keepOwnership) {
        _ZN7android13GraphicBufferC1EjjijjjP13native_handleb(inWidth, inHeight, inFormat, 1, inUsage, inStride, inHandle, keepOwnership);
    }

    void _ZN7android13GraphicBuffer4fromEP19ANativeWindowBuffer(ANativeWindowBuffer*);

    void _ZN7android13GraphicBufferC1EP19ANativeWindowBufferb(ANativeWindowBuffer* buffer, bool) {
        _ZN7android13GraphicBuffer4fromEP19ANativeWindowBuffer(buffer);
    }
}
