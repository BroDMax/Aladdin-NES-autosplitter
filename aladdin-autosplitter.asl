state("fceux")
{
    uint reset:     0x3B1388, 0x0018;
    byte start:     0x3B1388, 0x030D;
    byte level:     0x3B1388, 0x0024;
    byte demo:      0x3B1388, 0x00f8;
}

state("nestopia")
{
    uint reset:     "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x80;
    byte start:     "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x375;
    byte level:     "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x8C;
    byte demo:      "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x160;
}

state("mednafen")
{
    uint reset:     "mednafen.exe", 0xBE1CF8;
    byte start:     "mednafen.exe", 0xBE1FED;
    byte level:     "mednafen.exe", 0xBE1D04;
    byte demo:      "mednafen.exe", 0xBE1DD8;
}

state("punes64")
{
    uint reset:     0x13CDE58;
    byte start:     0x13CE14D;
    byte level:     0x13CDE64;
    byte demo:      0x13CDF38;
}

state("nintendulator")
{
    uint reset:     0x5C0E0;
    byte start:     0x5C3D5;
    byte level:     0x5C0EC;
    byte demo:      0x5C1C0;
}

state("mesen")
{
    uint reset:     "MesenCore.dll", 0x4311838, 0x118, 0xB8, 0x90, 0x1D8, 0x08, 0x18;
    byte start:     "MesenCore.dll", 0x4311838, 0x118, 0xB8, 0x90, 0x1D8, 0x08, 0x30D;
    byte level:     "MesenCore.dll", 0x4311838, 0x118, 0xB8, 0x90, 0x1D8, 0x08, 0x24;
    byte demo:      "MesenCore.dll", 0x4311838, 0x118, 0xB8, 0x90, 0x1D8, 0x08, 0xf8;
}

startup
{
    settings.Add("stg11", true, "Stage 1-1");
    settings.Add("stg12", true, "Stage 1-2");
    settings.Add("stg13", true, "Stage 1-3");
    settings.Add("stg14", true, "Stage 1-4");
    settings.Add("stg21", true, "Stage 2-1");
    settings.Add("stg22", true, "Stage 2-2");
    settings.Add("stg31", true, "Stage 3-1");
    settings.Add("stg32", true, "Stage 3-2");
    settings.Add("stg41", true, "Stage 4-1");
    settings.Add("stg42", true, "Stage 4-2");
    settings.Add("stg43", true, "Stage 4-3");
    settings.Add("stg51", true, "Stage 5-1");
    settings.Add("stg52", true, "Stage 5-2");
    settings.Add("stg6", true, "Stage 6");
    settings.Add("stg7", true, "Stage 7");
    settings.Add("stgJfr", true, "Jafar");
}

split
{
    if (old.level != current.level)
    {
        switch((int)current.level)
        {
            case 0x01:
                if (settings["stg11"]) return true;
                break;
            case 0x02:
                if (settings["stg12"]) return true;
                break;
            case 0x03:
                if (settings["stg13"]) return true;
                break;
            case 0x04:
                if (settings["stg14"]) return true;
                break;
            case 0x06:
                if (settings["stg21"]) return true;
                break;
            case 0x07:
                if (settings["stg22"]) return true;
                break;
            case 0x09:
                if (settings["stg31"]) return true;
                break;
            case 0x0A:
                if (settings["stg32"]) return true;
                break;
            case 0x0C:
                if (settings["stg41"]) return true;
                break;
            case 0x0D:
                if (settings["stg42"]) return true;
                break;
            case 0x0E:
                if (settings["stg43"]) return true;
                break;
            case 0x10:
                if (settings["stg51"]) return true;
                break;
            case 0x11:
                if (settings["stg52"]) return true;
                break;
            case 0x13:
                if (settings["stg6"]) return true;
                break;
            case 0x15:
                if (settings["stg7"]) return true;
                break;
            case 0x16:
                if (settings["stgJfr"]) return true;
                break;
        }
    }
}

reset
{
    return (current.level == 0x00) &&(current.reset == 0x9BBF831C);
}

start
{
    return (old.start == 0xFF) && (current.start == 0x07)
    && (current.level == 0x00)
    && (current.demo == 0x00);
}
