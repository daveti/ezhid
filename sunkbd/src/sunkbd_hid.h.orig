
/*
 *
 * $Id: sunkbd_hid.h,v 1.15 2004/02/15 01:20:13 arniml Exp $
 *
 *
 */


#if !defined (TRUE)
#define TRUE (1==1)
#endif
#if !defined (FALSE)
#define FALSE (!TRUE)
#endif


/*
 * Sun keyboard commands
 */
#define SUNKBD_CMD_RESET        0x01
#define SUNKBD_CMD_BELLON       0x02
#define SUNKBD_CMD_BELLOFF      0x03
#define SUNKBD_CMD_CLICK        0x0a
#define SUNKBD_CMD_NOCLICK      0x0b
#define SUNKBD_CMD_SETLED       0x0e
#define SUNKBD_CMD_LAYOUT       0x0f

#define SUNKBD_RET_RESET        0xff
#define SUNKBD_RET_ALLUP        0x7f
#define SUNKBD_RET_LAYOUT       0xfe

#define SUNKBD_LAYOUT_5_MASK    0x20
#define SUNKBD_RELEASE          0x80
#define SUNKBD_KEY              0x7f


/*
 * USB descriptor types
 */
#define USB_DT_DEVICE			0x01
#define USB_DT_CONFIG			0x02
#define USB_DT_STRING			0x03
#define USB_DT_INTERFACE		0x04
#define USB_DT_ENDPOINT			0x05

#define USB_DT_HID			0x21
#define USB_DT_REPORT			0x22
#define USB_DT_PHYSICAL			0x23
#define USB_DT_HUB			0x29

/* our main data type */
typedef unsigned char Byte;

/* mapping for the setup packet */
struct setup_dat {
      Byte bmRequestType;
      Byte bRequest;
      Byte wValueL;
      Byte wValueH;
      Byte wIndexL;
      Byte wIndexH;
      Byte wLengthL;
      Byte wLengthH;
};

typedef struct setup_dat setup_dat;


/*
 * variables for keyboard management
 */
#if defined (KEYBOARD)
/* store the keyboard type */
volatile static data char sunkbd_type;
/* flag for pending reset */
volatile static data char sunkbd_reset;
/* layout flag */
volatile static data char sunkbd_layout;

/* key buffer */
volatile data Byte key_buffer[8];

/*
 * transmit queue
 * at the moment only one byte deep and restricted to 0-127
 */
volatile data char kbd_txmit_me;   /* apply_reset_values */
#endif

/*
 * variables for mouse management
 */
#if defined (MOUSE)
/* intermediate space to hold mouse data during transmission */
volatile data char mbuf0, mbuf1, mbuf2;

/* mouse buffer */
volatile data char mouse_buffer[8];

/* current state of mouse packet reception */
volatile data Byte mouse_state;
#endif


/*
 * USB related stuff
 */

#if defined (KEYBOARD)
/* report has changed, in1buf should be transferred on the next opportunity */
static bit kbd_new_keys;             /* apply_reset_values */
/* the next output packet is related to a control transfer after SETUP */
static bit is_ctrl_out0_kbd;         /* apply_reset_values */
/*
 * remember IDLE mode
 */
static bit kbd_idle_mode;            /* apply_reset_values */
/*
 * idle duration expressed as multiples of 4 ms
 * default is 125 * 4 ms = 500 ms
 */
static data Byte kbd_idle_duration;  /* apply_reset_values */
static data Byte kbd_idle_counter;
/* busy semaphore for IN1 endpoint */
static bit in1_busy;                 /* apply_reset_values */
#endif

#if defined (MOUSE)
/* report has changed, in2buf should be transferred on the next opportunity */
static bit mouse_new_keys;           /* apply_reset_values */
/* the next output packet is related to a control transfer after SETUP */
static bit is_ctrl_out0_mouse;       /* apply_reset_values */
/*
 * remember IDLE mode
 */
static bit mouse_idle_mode;          /* apply_reset_values */
/*
 * idle duration expressed as multiples of 4 ms
 * default is 5 * 4 ms = 20 ms
 */
static data Byte mouse_idle_duration; /* apply_reset_values */
static data Byte mouse_idle_counter;
/* busy semaphore for IN2 endpoint */
static bit in2_busy;                 /* apply_reset_values */
#endif


/* the device descriptor */
static code Byte dev_desc[] = {
   0x12, // bLength             : Length of Descriptor
   0x01, // bDescriptorType     : Descriptor Type = Device
   0x00, // bcdUSB (L)          : USB Specification Version 1.00 (L)
   0x01, // bcdUSB (H)          : USB Specification Version 1.00 (H)
   0x00, // bDeviceClass        : Device Class (0xff is Vendor Specific)
   0x00, // bDeviceSubClass     : Device Sub-Class (0xff is Vendor Specific)
   0x00, // bDeviceProtocol     : Device Protocol (0xff is Vendor Specific)
   0x40, // bMaxPacketSize0     : Maximum Packet Size for EP0
   0xcd, // idVendor (L)        : Vendor ID (L)
   0x06, // idVendor (H)        : Vendor ID (H)
   0x01, // idProduct (L)       : Product ID (L)
   0xc0, // idProduct (H)       : Product ID (H)
   0x55, // bcdDevice (L)       : Device Release Number (BCD,L)
   0x01, // bcdDevice (H)       : Device Release Number (BCD,H)
   0x01, // iManufacturer       : Manufacturer Index String
   0x02, // iProduct            : Product Index String
   0x00, // iSerialNumber       : Serial Number Index String
   0x01  // bNumConfigurations  : Number of Configurations in this Device
};

/* the configuration descriptor */
static code Byte conf_desc[] = {
   0x09, // bLength             : Length of Descriptor
   0x02, // bDescriptorType     : Descriptor Type = Configuration
#if defined (KEYBOARD) && defined (MOUSE)
   0x3b, // wTotalLength (L)    : Total Length (L) including Interface and Endpoint
#elif defined (KEYBOARD)
   0x22, // wTotalLength (L)    : Total Length (L) including Interface and Endpoint
#elif defined (MOUSE)
   0x22, // wTotalLength (L)    : Total Length (L) including Interface and Endpoint
#else
   0x09, // wTotalLength (L)    : Total Length (L) including Interface and Endpoint
#endif
   0x00, // wTotalLength (H)    : Total Length (H)

#if defined (KEYBOARD) && defined (MOUSE)
   0x02, // bNumInterfaces      : Two Interfaces in this Configuration
#elif defined (KEYBOARD) || defined (MOUSE)
   0x01, // bNumInterfaces      : One Interface in this Configuration
#else
   0x00, // bNumInterfaces      : No Interfaces in this Configuration
#endif

   0x01, // bConfigurationValue : Configuration Value Used by Set_Configuration Request
         //                       to Select this Configuration
   0x00, // iConfiguration      : Index of String Describing this Configuration
   0x80, // bmAttributes        : Attributes
   0x64, // MaxPower            : Maximum Power


   /*
    * The Keyboard interface descriptor
    */
#if defined (KEYBOARD)
   // Interface 0, alternate setting 0
   0x09, // bLength             : Length of Descriptor
   0x04, // bDescriptorType     : Descriptor Type = Interface
   0x00, // bInterfaceNumber    : Zero-based index of this Interface
   0x00, // bAlternateSetting   : Alternate Setting
   0x01, // bNumEndpoints       : Number of Endpoints in this Interface
   0x03, // bInterfaceClass     : Interface Class
   0x01, // bInterfaceSubClass  : Interface Sub-Class (boot interface)
   0x01, // bInterfaceProtocol  : Interface Protocol (keyboard)
   0x03, // iInterface          : Index to String Descriptor for this Interface
   
   // HID Descriptor
   0x09, // bLength             : Length of Descriptor
   0x21, // bDescriptorType     : Descriptor Type = HID
   0x00, // bcdHID (L)          : HID Class Specification release number (L)
   0x01, // bcdHID (H)          : HID Class Specification release number (H)
   0x21, // bCountryCode        : Hardare target country = US
   0x01, // bNumDescriptors     : Number of HID class descriptors to follow
   0x22, // bDescriptorType     : Report descriptor type
   0x3f, // wDescriptorLength(L): Total length of Report descriptor (L)
   0x00, // wDescriptorLength(H): Total length of Report descriptor (H)
   
   // Endpoint Descriptor
   0x07, // bLength             : Length of Descriptor
   0x05, // bDescriptorType     : Descriptor Type = Endpoint
   0x81, // bEndpointAddress    : Endpoint Address
   0x03, // bmAttributes        : Endpoint Attributes = INT
   0x08, // wMaxPacketSize (L)  : Maximum Packet Size (L)
   0x00, // wMaxPacketSize (H)  : Maximum Packet Size (H)
   0x0a  // bInterval           : Polling intervall in Milliseconds
#endif


   /*
    * The Mouse interface descriptor
    */
#if defined (MOUSE)
   // Interface 0/1, alternate setting 0
#if defined (KEYBOARD)
   ,
#endif
   0x09, // bLength             : Length of Descriptor
   0x04, // bDescriptorType     : Descriptor Type = Interface
#if !defined (KEYBOARD)
   0x00, // bInterfaceNumber    : Index of Interface (0)
#else
   0x01, // bInterfaceNumber    : Index of Interface (1)
#endif
   0x00, // bAlternateSetting   : Alternate Setting
   0x01, // bNumEndpoints       : Number of Endpoints in this Interface
   0x03, // bInterfaceClass     : Interface Class
   0x01, // bInterfaceSubClass  : Interface Sub-Class (boot interface)
   0x02, // bInterfaceProtocol  : Interface Protocol (mouse)
#if !defined (KEYBOARD)
   0x03, // iInterface          : Index to String Descriptor for this Interface
#else
   0x04, // iInterface          : Index to String Descriptor for this Interface
#endif

   /* HID Descriptor */
   0x09, // bLength             : Length of Descriptor
   0x21, // bDescriptorType     : Descriptor Type = HID
   0x00, // bcdHID (L)          : HID Class Specification release number (L)
   0x01, // bcdHID (H)          : HID Class Specification release number (H)
   0x00, // bCountryCode        : Hardare target country
   0x01, // bNumDescriptors     : Number of HID class descriptors to follow
   0x22, // bDescriptorType     : Report descriptor type
   0x32, // wDescriptorLength(L): Total length of Report descriptor (L)
   0x00, // wDescriptorLength(H): Total length of Report descriptor (H)
   
   /* Endpoint Descriptor */
   0x07, // bLength             : Length of Descriptor
   0x05, // bDescriptorType     : Descriptor Type = Endpoint
   0x82, // bEndpointAddress    : Endpoint Address
   0x03, // bmAttributes        : Endpoint Attributes = INT
   0x08, // wMaxPacketSize (L)  : Maximum Packet Size (L)
   0x00, // wMaxPacketSize (H)  : Maximum Packet Size (H)
   0x0a  // bInterval           : Polling intervall in Milliseconds
#endif
};


/* the Keyboard Report Descriptor */
#if defined (KEYBOARD)
static code Byte report_desc_keyboard[] = {
   0x05, 0x01, // Usage Page (Generic, Desktop),
   0x09, 0x06, // Usage (Keyboard),
   0xa1, 0x01, // Collection (Application),
   0x05, 0x07, //   Usage Page (Key Codes);
   0x19, 0xe0, //   Usage Maximum (224),
   0x29, 0xe7, //   Usage Minimum (231),
   0x15, 0x00, //   Logical Minimum (0),
   0x25, 0x01, //   Logical Maximum (1),
   0x75, 0x01, //   Report Size (1),
   0x95, 0x08, //   Report Count (8),
   0x81, 0x02, //   Input (Data, Variable, Absolute), ;Modifier byte
   0x95, 0x01, //   Report Count (1),
   0x75, 0x08, //   Report Size (8),
   0x81, 0x01, //   Input (Constant),                 ;Reserved byte
   0x95, 0x05, //   Report Count (5),
   0x75, 0x01, //   Report Size (1),
   0x05, 0x08, //   Usage Page (Page# for LEDs),
   0x19, 0x01, //   Usage Minimum (1),
   0x29, 0x05, //   Usage Maximum (5),
   0x91, 0x02, //   Output (Data, Variable, Absolute) ;LED report
   0x95, 0x01, //   Report Count (1),
   0x75, 0x03, //   Report Size (3),
   0x91, 0x01, //   Output (Constant),                ;LED report padding
   0x95, 0x06, //   Report Count (6),
   0x75, 0x08, //   Report Size (8),
   0x15, 0x00, //   Logical Minimum (0),
   0x25, 0x65, //   Logical maximum (101),
   0x05, 0x07, //   Usage Page (Key Codes),
   0x19, 0x00, //   Usage Minimum (0),
   0x29, 0x65, //   Usage Maximum (101),
   0x81, 0x00, //   Input (Data, Array),              ;Key array (6 bytes)
   0xc0        // End Collection
};
#endif

#if defined (MOUSE)
static code Byte report_desc_mouse[] = {
   0x05, 0x01, // Usage Page (Generic Desktop),
   0x09, 0x02, // Usage (Mouse),
   0xa1, 0x01, // Collection (Application),
   0x09, 0x01, //   Usage (Pointer),
   0xa1, 0x00, //   Collection (Physical),
   0x95, 0x03, //     Report Count (3),
   0x75, 0x01, //     Report Size (1),
   0x05, 0x09, //     Usage Page (Buttons),
   0x19, 0x01, //     Usage Minimum (01),
   0x29, 0x03, //     Usage Maximum (03),
   0x15, 0x00, //     Logical Minimum (0),
   0x25, 0x01, //     Logical Maximum (1),
   0x81, 0x02, //     Input (Data, Variable, Absolute), ;3 button bits
   0x95, 0x01, //     Report Count (1),
   0x75, 0x05, //     Report Size(5),
   0x81, 0x01, //     Input (Constant),                 ;5 bit padding
   0x75, 0x08, //     Report Size (8),
   0x95, 0x02, //     Report Count (2),
   0x05, 0x01, //     Usage Page (Generic Desktop),
   0x09, 0x30, //     Usage (X),
   0x09, 0x31, //     Usage (Y),
   0x15, 0x81, //     Logical Minimum (-127),
   0x25, 0x7f, //     Logical Maximum (127),
   0x81, 0x06, //     Input (Data, Variable, Relative), ;2 position bytes (X & Y)
   0xc0,       //   End Collection,
   0xc0        // End Collection
};
#endif


/* language ID string descriptor */
static code Byte string_langid[] = { 0x04, 0x03, 0x00, 0x00 };

/* manufacturer string descriptor */
static code Byte string_mfg[] = {
   0x22, 0x03,
   'A',0, 'C',0, 'M',0, 'E',0, ' ',0, 'u',0, 's',0, 'b',0,
   ' ',0, 'W',0, 'i',0, 'd',0, 'g',0, 'e',0, 't',0, 's',0
};

/* product string descriptor */
static code Byte string_prod[] = {
#if defined (KEYBOARD) && !defined (MOUSE)
   0x22, 0x03,
   'S',0, 'u',0, 'n',0, ' ',0, 'k',0, 'e',0, 'y',0, 'b',0,
   'o',0, 'a',0, 'r',0, 'd',0, ' ',0, 'H',0, 'I',0, 'D',0
#elif !defined (KEYBOARD) && defined (MOUSE)
   0x1c, 0x03,
   'S',0, 'u',0, 'n',0, ' ',0, 'm',0, 'o',0, 'u',0, 's',0,
   'e',0, ' ',0, 'H',0, 'I',0, 'D',0
#elif  defined (KEYBOARD) && defined (MOUSE)
   0x32, 0x03,
   'S',0, 'u',0, 'n',0, ' ',0, 'k',0, 'e',0, 'y',0, 'b',0,
   'o',0, 'a',0, 'r',0, 'd',0, ' ',0, '&',0, ' ',0, 'm',0,
   'o',0, 'u',0, 's',0, 'e',0, ' ',0, 'H',0, 'I',0, 'D',0
#else
   0x10, 0x03,
   'N',0, 'o',0, ' ',0, 'H',0, 'I',0, 'D',0
#endif
};

#if defined (KEYBOARD)
/* keyboard interface string descriptor */
static code Byte string_if_keyboard[] = {
   0x86, 0x03,
   'S',0, 'u',0, 'n',0, ' ',0, 'K',0, 'e',0, 'y',0, 'b',0,
   'o',0, 'a',0, 'r',0, 'd',0, ' ',0, 'H',0, 'I',0, 'D',0,
   ' ',0, 'D',0, 'r',0, 'i',0, 'v',0, 'e',0, 'r',0, ',',0,
   ' ',0, 'F',0, 'i',0, 'r',0, 'm',0, 'w',0, 'a',0, 'r',0,
   'e',0, ' ',0, 'C',0, 'o',0, 'p',0, 'y',0, 'r',0, 'i',0,
   'g',0, 'h',0, 't',0, ' ',0, '(',0, 'c',0, ')',0, ' ',0,
   '2',0, '0',0, '0',0, '2',0, ' ',0, 'A',0, 'r',0, 'n',0,
   'i',0, 'm',0, ' ',0, 'L',0, 'a',0, 'e',0, 'u',0, 'g',0,
   'e',0, 'r',0
};
#endif

#if defined (MOUSE)
/* mouse interface string descriptor */
static code Byte string_if_mouse[] = {
   0x80, 0x03,
   'S',0, 'u',0, 'n',0, ' ',0, 'M',0, 'o',0, 'u',0, 's',0,
   'e',0, ' ',0, 'H',0, 'I',0, 'D',0, ' ',0, 'D',0, 'r',0,
   'i',0, 'v',0, 'e',0, 'r',0, ',',0, ' ',0, 'F',0, 'i',0,
   'r',0, 'm',0, 'w',0, 'a',0, 'r',0, 'e',0, ' ',0, 'C',0,
   'o',0, 'p',0, 'y',0, 'r',0, 'i',0, 'g',0, 'h',0, 't',0,
   ' ',0, '(',0, 'c',0, ')',0, ' ',0, '2',0, '0',0, '0',0,
   '2',0, ' ',0, 'A',0, 'r',0, 'n',0, 'i',0, 'm',0, ' ',0,
   'L',0, 'a',0, 'e',0, 'u',0, 'g',0, 'e',0, 'r',0
};
#endif


/* index for all string descriptors */
#if defined (KEYBOARD) && defined (MOUSE)
#define NUM_STRING 5
#elif defined (MOUSE) || defined (KEYBOARD)
#define NUM_STRING 4
#endif

static data unsigned int string_index[NUM_STRING] = {
   (unsigned int)string_langid,
   (unsigned int)string_mfg,
   (unsigned int)string_prod
#if defined (KEYBOARD)
  ,(unsigned int)string_if_keyboard
#endif
#if defined(MOUSE)
  ,(unsigned int)string_if_mouse
#endif
};


/*
 * mapping from sun scancodes to USB HID/HUT
 */
static code Byte scancode_map[] = {
   0x00, 0x78, 0x81, 0x79, 0x80, 0x3a, 0x3b, 0x43, 0x3c, 0x44, 0x3d, 0x45, 0x3e, 0xe4, 0x3f, 0x00,
   0x40, 0x41, 0x42, 0xe2, 0x52, 0x48, 0x46, 0x47, 0x50, 0x74, 0x7a, 0x51, 0x4f, 0x29, 0x1e, 0x1f,
   0x20, 0x21, 0x22, 0x23, 0x24, 0x25, 0x26, 0x27, 0x2d, 0x2e, 0x35, 0x2a, 0x49, 0x00, 0x54, 0x55,
   0x00, 0x00, 0x63, 0x7c, 0x4a, 0x2b, 0x14, 0x1a, 0x08, 0x15, 0x17, 0x1c, 0x18, 0x0c, 0x12, 0x13,
   0x2f, 0x30, 0x4c, 0x65, 0x5f, 0x60, 0x61, 0x56, 0x00, 0x7d, 0x4d, 0xff, 0xe0, 0x04, 0x16, 0x07,
   0x09, 0x0a, 0x0b, 0x0d, 0x0e, 0x0f, 0x33, 0x34, 0x31, 0x28, 0x58, 0x5c, 0x5d, 0x5e, 0x62, 0x7e,
   0x4b, 0x7b, 0x53, 0xe1, 0x1d, 0x1b, 0x06, 0x19, 0x05, 0x11, 0x10, 0x36, 0x37, 0x38, 0xe5, 0x00,
   0x59, 0x5a, 0x5b, 0xff, 0xff, 0xff, 0x75, 0x39, 0xe3, 0x2c, 0xe7, 0x4e, 0xff, 0x57, 0x00, 0x00
};


/*
 * global pointers
 */
#define in0buf(n)  (&IN0BUF)[n]
#define in1buf(n)  (&IN1BUF)[n]
#define in2buf(n)  (&IN2BUF)[n]
#define out0buf(n) (&OUT0BUF)[n]
static xdata setup_dat * data sdat = (xdata setup_dat *)&SETUPDAT;

/*
 * values for endpoint validation
 */
#if defined (KEYBOARD) && defined (MOUSE)
#define SUNKBD_INVAL  0x07
#else
#if defined (KEYBOARD)
#define SUNKBD_INVAL  0x03
#else
#if defined (MOUSE)
#define SUNKBD_INVAL  0x05
#else
#define SUNKBD_INVAL  0x01
#endif
#endif
#endif

#define SUNKBD_OUTVAL 0x01




/*****************************************************************************
 *
 * Change History:
 *
 * $Log: sunkbd_hid.h,v $
 * Revision 1.15  2004/02/15 01:20:13  arniml
 * global variables should be declared as volatile when used in inteerupt context
 *
 * Revision 1.14  2004/02/07 12:58:19  arniml
 * + double-buffer mouse events (mbufX)
 * + increment device release number to 1.55
 *
 * Revision 1.13  2004/01/25 12:40:04  arniml
 * uppercase 'W' in vendor string
 *
 * Revision 1.12  2004/01/22 21:27:17  arniml
 * increment Device Release Number to 1.54
 *
 * Revision 1.11  2003/12/31 13:38:40  arniml
 * increment device release number
 * 1.52 => 1.53
 * this marks the ALL_UP-fix release
 *
 * Revision 1.10  2002/09/02 22:51:35  arniml
 * increment device release number
 * 1.51 => 1.52
 * this reflects some important fixes in sunkbd_hid.c for endpoint stalling
 * and data toggle control
 *
 * Revision 1.9  2002/09/01 12:14:17  arniml
 * increment device release number
 * 1.50 => 1.51
 *
 * Revision 1.8  2002/05/05 19:12:06  arniml
 * use macros instead of pointer variables to USB buffers
 *
 * Revision 1.7  2002/03/04 19:39:43  arniml
 * - increment Device Release Number
 * - update copyright strings
 *
 * Revision 1.6  2002/03/03 23:37:59  arniml
 * + fix calculation of SUNKBD_INVAL
 * + move initialization of most global variables to firmware code
 *   this is necessary to initialize vars upon USB reset
 *
 * Revision 1.5  2002/02/25 23:25:42  arniml
 * set macros for endpoint validation
 *
 * Revision 1.4  2002/01/20 14:29:57  arniml
 * device release number = 1.40
 *
 * Revision 1.3  2001/08/19 19:46:13  arniml
 * turn mouse_buffer into an array of signed char
 *
 * Revision 1.2  2001/08/15 18:28:33  arniml
 * add variables and descriptors for mouse support
 * make keyboard and mouse support configurable
 *
 * Revision 1.1.1.1  2001/07/14 15:32:41  arniml
 * initial import
 */
