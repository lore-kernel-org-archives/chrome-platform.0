Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F0D2475F7
	for <chrome-platform@lists.linux.dev>; Sat, 18 Jul 2026 02:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784341338; cv=none; b=oUAbUrZQlASumIVFQM4ZhZpvsL5wnt9BKKExxltwKN56Ml2fzqorEGY0FSzmaAAziQwcQ1Rs1xQgAzI5iXxFvOTFn7PFHBvL4aE19oPLhTA5fcif3c2I1JtTSFMcf1BZwxoIKQloBt11oH9CKZqQllh1IA4YeQa+yukULIhLqPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784341338; c=relaxed/simple;
	bh=Edh2TrG99oQiXSL/ZsaqNhwjoJJlC/LprqcxSVNNNVU=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=Ub3YsIkSA/EB2U0uHuDsn8B7fMF46j7jcQJlGz2Kg4Cc+dk80YhnbQ36vkQeBFTFgzWkqA/9GM1cVOTZ4Ix5vyheH7bGDPkBuC72SU1hwDeckqRl3txPEvAdl97/BXrMMKyEThbH6eOS6HVQjMher2A2Cdp6lJRafqVOxJYMRX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xt6l7WS0; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xt6l7WS0"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c96c92c0980so3360730a12.3
        for <chrome-platform@lists.linux.dev>; Fri, 17 Jul 2026 19:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784341334; x=1784946134; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ExB1p3Z3IT7x/9bhPdQsOZ/rnXj+b/pRJqJqdJYDkHU=;
        b=Xt6l7WS0OSHuQ80PF3y50+F2h+qYP5KCKfubXTw2PNOgkekKzMOQJEa3P9x0gDYZPe
         unDS4p5m0tieBKhM9vW7whPze8JLKjz0NjQz4XmF1BclaYChFkCnV3e+x/I7vW2B1PVd
         tuhrCg/GSfW8RbvtDt3Zd32Z5M+xKh531CUw8+UXOTuiqsSc/BIdkNtC9nU+HwE5rQ0n
         djPXwx5sdZE8i/9luvjF+eE9Xe8ZQ/INi7pUwvQ3R4eZikwZ3lKAb93cbyFN6bez2EtN
         AHnvPb2i5cMU7/4DSqOwUCckvmKuRXrQ9tRxprzwpuFe6vIH82quSnfO02ZIr+oXHPb9
         o5jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784341334; x=1784946134;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ExB1p3Z3IT7x/9bhPdQsOZ/rnXj+b/pRJqJqdJYDkHU=;
        b=TLqk7Vz5ErZczMOua7dO24YUuI/4J2+kIlGnmQrrPDx6xbUPQVtnF5hsCYr4x7a2ln
         lTrfgg4jaQIUa+dRAF/xRqTMhJFMpZir4/wW1MU91hlTnSF5LC1EuEmAroF60664x3HR
         zhnplp8rB3gfU4oGQ21+wce788/rH3vlZUjSLLMYPPv9C0foU29dFpynsrXXefNnTFkd
         8QXr4lBSeyZiVjuDRH/Eu+i2yqBcc/G1cZiP5HlsMWLVXq3JSXU6yVe0UVg9VyK31p4H
         yH6b0XCLanGSVWt8rj6rL8FtGr8pevEyqEfvlC8NgDEDRFmnb4YTh1rLZZDPHaH2OF6O
         eOAg==
X-Forwarded-Encrypted: i=1; AHgh+RrduYnaUR8V/5g7e5tACxqYnh+Ib+0b0UHQ+TYrzyucF/D139kzNqxx1p48Z7z8S2FoAp95vUFn3wrfuFTjdH0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw52HA+QbKVDz8gPDOPC4No7G/YK3C/5iLh5WHX7mhy0zLFao/S
	znK0VijtPXOLvWrcbwkebOaoYoMuSsaJUxd+/VZb4gOpNoY3FhPVBlad
X-Gm-Gg: AfdE7ckUf9EQVQl/d4L6bRm/SiIfo6uYrYBIweEkzqkEyX/p0IoW9e0JnM/qUEaTGUy
	MGUTcK8hvgMLNqwhhFAVgrzOGcJEMi+e/XlX23fZuSgNngQBm/B03CSwOcFse4RYD5Px/nH0GV4
	t2B/Qf+ZWyQkuXHIYXlE239hPq+K1qWnfrZ5MPdOXXM6cAGHEC9sYbnEbgUaiMJl7TX1nc+0nhE
	dJk+rHkxm0tSQBkOZWLWjKa+EWL2Co5Tlet3hyVtxhqRGKPSd5bF6SUiQF1jsjLddAVjd6yzn6d
	sKKBgSlVT8v70dPsGtWezT41xYwFqoh1ctJWyky7VaL3/hDLir0AckE6wFk0IBikYIdm8T0VQQL
	VX1sVT4s3d17Dg5H072aoX1+tHg/pzojKl6f9zdrUE6mwxETPaV1Ab/6jpbicRF56c33lK9eT4h
	sFMMLu9foayj7f5PTGeuMhJeLUEvHFf7LzlOpWIU+n1ASr9lFgcSnQccQ0k2p+O/pXUJkNXllW
X-Received: by 2002:a05:6300:95:b0:3b4:5ff3:45cb with SMTP id adf61e73a8af0-3c3ad79fb45mr5829768637.8.1784341334288;
        Fri, 17 Jul 2026 19:22:14 -0700 (PDT)
Received: from ehlo.thunderbird.net (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a20c158sm12581874eec.29.2026.07.17.19.22.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2026 19:22:13 -0700 (PDT)
Date: Fri, 17 Jul 2026 19:22:08 -0700
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Sean Rhodes <sean@starlabs.systems>, tzungbi@kernel.org
CC: hansg@kernel.org, ilpo.jarvinen@linux.intel.com, corentin.chary@gmail.com,
 luke@ljones.dev, denis.benato@linux.dev, prasanth.ksr@dell.com,
 jorge.lopez2@hp.com, mpearson-lenovo@squebb.ca, josh@joshuagrisham.com,
 briannorris@chromium.org, jwerner@chromium.org, tzimmermann@suse.de,
 javierm@redhat.com, kees@kernel.org, u.kleine-koenig@baylibre.com,
 mst@redhat.com, chenhuacai@kernel.org, wenst@chromium.org,
 florian.fainelli@broadcom.com, titouan.ameline@gmail.com,
 oliver@liuxiaozhen.dev, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com,
 chrome-platform@lists.linux.dev
Subject: Re: [PATCH v7 1/3] firmware: Move firmware attributes class helper
User-Agent: Thunderbird for Android
In-Reply-To: <20260717085003.369496-2-sean@starlabs.systems>
References: <20260717085003.369496-1-sean@starlabs.systems> <20260717085003.369496-2-sean@starlabs.systems>
Message-ID: <99A0E55C-A79E-4BBC-B7E6-B5F4172F62AD@gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On July 17, 2026 1:50:01 AM PDT, Sean Rhodes <sean@starlabs=2Esystems> wrot=
e:
>Move the firmware attributes class helper from drivers/platform/x86 to
>drivers/firmware and expose its class declaration through a public Linux
>header=2E
>
>The helper is not x86-specific=2E Keeping it in firmware lets coreboot
>firmware drivers use the standard firmware-attributes ABI without living
>under platform/x86=2E
>
>Reviewed-by: Mark Pearson <mpearson-lenovo@squebb=2Eca>
>Reviewed-by: Derek J=2E Clark <derekjohn=2Eclark@gmail=2Ecom>
>Tested-by: Oliver Lin <oliver@liuxiaozhen=2Edev>
>Signed-off-by: Sean Rhodes <sean@starlabs=2Esystems>
>---
> MAINTAINERS                                               | 8 ++++++++
> drivers/firmware/Kconfig                                  | 3 +++
> drivers/firmware/Makefile                                 | 1 +
> =2E=2E=2E/x86 =3D> firmware}/firmware_attributes_class=2Ec          | 2 =
+-
> drivers/platform/x86/Kconfig                              | 3 ---
> drivers/platform/x86/Makefile                             | 2 --
> drivers/platform/x86/asus-armoury=2Ec                       | 2 +-
> drivers/platform/x86/dell/dell-wmi-sysman/sysman=2Ec        | 2 +-
> drivers/platform/x86/hp/hp-bioscfg/bioscfg=2Ec              | 2 +-
> drivers/platform/x86/lenovo/think-lmi=2Ec                   | 2 +-
> drivers/platform/x86/lenovo/wmi-other=2Ec                   | 2 +-
> drivers/platform/x86/samsung-galaxybook=2Ec                 | 2 +-
> =2E=2E=2E/linux/firmware_attributes=2Eh                           | 6 ++=
+---
> 13 files changed, 22 insertions(+), 15 deletions(-)
> rename drivers/{platform/x86 =3D> firmware}/firmware_attributes_class=2E=
c (94%)
> rename drivers/platform/x86/firmware_attributes_class=2Eh =3D> include/l=
inux/firmware_attributes=2Eh (60%)
>
>diff --git a/MAINTAINERS b/MAINTAINERS
>index f37a81950e25=2E=2E07bdba98b1b1 100644
>--- a/MAINTAINERS
>+++ b/MAINTAINERS
>@@ -10114,6 +10114,14 @@ F:	include/linux/firewire=2Eh
> F:	include/uapi/linux/firewire*=2Eh
> F:	tools/firewire/
>=20
>+FIRMWARE ATTRIBUTES CLASS
>+M:	Hans de Goede <hansg@kernel=2Eorg>
>+M:	Ilpo J=C3=A4rvinen <ilpo=2Ejarvinen@linux=2Eintel=2Ecom>
>+L:	platform-driver-x86@vger=2Ekernel=2Eorg
>+S:	Maintained
>+F:	drivers/firmware/firmware_attributes_class=2Ec
>+F:	include/linux/firmware_attributes=2Eh
>+
> FIRMWARE FRAMEWORK FOR ARMV8-A
> M:	Sudeep Holla <sudeep=2Eholla@kernel=2Eorg>
> L:	linux-arm-kernel@lists=2Einfradead=2Eorg (moderated for non-subscribe=
rs)
>diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
>index 12dc70254842=2E=2E78a239f8bbef 100644
>--- a/drivers/firmware/Kconfig
>+++ b/drivers/firmware/Kconfig
>@@ -8,6 +8,9 @@ menu "Firmware Drivers"
>=20
> source "drivers/firmware/arm_scmi/Kconfig"
>=20
>+config FW_ATTR_CLASS
>+	tristate
>+
> config ARM_SCPI_PROTOCOL
> 	tristate "ARM System Control and Power Interface (SCPI) Message Protoco=
l"
> 	depends on ARM || ARM64 || COMPILE_TEST
>diff --git a/drivers/firmware/Makefile b/drivers/firmware/Makefile
>index 4ddec2820c96=2E=2E385b6e8b7fc6 100644
>--- a/drivers/firmware/Makefile
>+++ b/drivers/firmware/Makefile
>@@ -16,6 +16,7 @@ obj-$(CONFIG_FIRMWARE_MEMMAP)	+=3D memmap=2Eo
> obj-$(CONFIG_MTK_ADSP_IPC)	+=3D mtk-adsp-ipc=2Eo
> obj-$(CONFIG_RASPBERRYPI_FIRMWARE) +=3D raspberrypi=2Eo
> obj-$(CONFIG_FW_CFG_SYSFS)	+=3D qemu_fw_cfg=2Eo
>+obj-$(CONFIG_FW_ATTR_CLASS)	+=3D firmware_attributes_class=2Eo
> obj-$(CONFIG_SYSFB)		+=3D sysfb=2Eo
> obj-$(CONFIG_SYSFB_SIMPLEFB)	+=3D sysfb_simplefb=2Eo
> obj-$(CONFIG_TH1520_AON_PROTOCOL) +=3D thead,th1520-aon=2Eo
>diff --git a/drivers/platform/x86/firmware_attributes_class=2Ec b/drivers=
/firmware/firmware_attributes_class=2Ec
>similarity index 94%
>rename from drivers/platform/x86/firmware_attributes_class=2Ec
>rename to drivers/firmware/firmware_attributes_class=2Ec
>index 736e96c186d9=2E=2E503ecc288086 100644
>--- a/drivers/platform/x86/firmware_attributes_class=2Ec
>+++ b/drivers/firmware/firmware_attributes_class=2Ec
>@@ -3,7 +3,7 @@
> /* Firmware attributes class helper module */
>=20
> #include <linux/module=2Eh>
>-#include "firmware_attributes_class=2Eh"
>+#include <linux/firmware_attributes=2Eh>
>=20

Hi Sean,

I think there is a middle ground between just renaming these while knowing=
ly having them all in the wrong spot, and reorganizing all the includes for=
 drivers whose includes aren't properly alphabetized in a single patch=2E O=
ne of these options would be preferable:

- Introduce a cleanup patch before the rename that does the reordering, th=
en rename in the correct order=2E

- Do the rename without a full reordering, placing the firmware attributes=
 include right after its preceding alphabetical order location so that it w=
ouldn't need to be moved if someone else does a full reordering later=2E

Personally I think the first option is better, but if that's out of your d=
esired scope or you're worried about additional effects in existing drivers=
 then please at least do the second option=2E

Thanks,
Derek

> const struct class firmware_attributes_class =3D {
> 	=2Ename =3D "firmware-attributes",
>diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
>index b54b5212b204=2E=2Ebeed14c38b54 100644
>--- a/drivers/platform/x86/Kconfig
>+++ b/drivers/platform/x86/Kconfig
>@@ -926,9 +926,6 @@ config DASHARO_ACPI
>=20
> source "drivers/platform/x86/x86-android-tablets/Kconfig"
>=20
>-config FW_ATTR_CLASS
>-	tristate
>-
> config INTEL_IMR
> 	bool "Intel Isolated Memory Region support"
> 	depends on X86_INTEL_QUARK && IOSF_MBI
>diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefil=
e
>index 872ac3842391=2E=2Ecab20a4145e3 100644
>--- a/drivers/platform/x86/Makefile
>+++ b/drivers/platform/x86/Makefile
>@@ -63,8 +63,6 @@ obj-$(CONFIG_X86_PLATFORM_DRIVERS_HP)	+=3D hp/
> # Hewlett Packard Enterprise
> obj-$(CONFIG_UV_SYSFS)       +=3D uv_sysfs=2Eo
>=20
>-obj-$(CONFIG_FW_ATTR_CLASS)	+=3D firmware_attributes_class=2Eo
>-
> # IBM Thinkpad (before 2005)
> obj-$(CONFIG_IBM_RTL)		+=3D ibm_rtl=2Eo
> obj-$(CONFIG_SENSORS_HDAPS)	+=3D hdaps=2Eo
>diff --git a/drivers/platform/x86/asus-armoury=2Ec b/drivers/platform/x86=
/asus-armoury=2Ec
>index 495dc1e31d40=2E=2E93fac0d464d2 100644
>--- a/drivers/platform/x86/asus-armoury=2Ec
>+++ b/drivers/platform/x86/asus-armoury=2Ec
>@@ -34,7 +34,7 @@
> #include <linux/sysfs=2Eh>
>=20
> #include "asus-armoury=2Eh"
>-#include "firmware_attributes_class=2Eh"
>+#include <linux/firmware_attributes=2Eh>
>=20
> #define ASUS_NB_WMI_EVENT_GUID "0B3CBB35-E3C2-45ED-91C2-4C5A6D195D1C"
>=20
>diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/sysman=2Ec b/drive=
rs/platform/x86/dell/dell-wmi-sysman/sysman=2Ec
>index ab46a023cc34=2E=2E85670be01647 100644
>--- a/drivers/platform/x86/dell/dell-wmi-sysman/sysman=2Ec
>+++ b/drivers/platform/x86/dell/dell-wmi-sysman/sysman=2Ec
>@@ -16,7 +16,7 @@
> #include <linux/sysfs=2Eh>
> #include <linux/wmi=2Eh>
> #include "dell-wmi-sysman=2Eh"
>-#include "=2E=2E/=2E=2E/firmware_attributes_class=2Eh"
>+#include <linux/firmware_attributes=2Eh>
>=20
> #define MAX_TYPES  4
> #include <linux/nls=2Eh>
>diff --git a/drivers/platform/x86/hp/hp-bioscfg/bioscfg=2Ec b/drivers/pla=
tform/x86/hp/hp-bioscfg/bioscfg=2Ec
>index 27fd6cd21529=2E=2E44314ae4e5e3 100644
>--- a/drivers/platform/x86/hp/hp-bioscfg/bioscfg=2Ec
>+++ b/drivers/platform/x86/hp/hp-bioscfg/bioscfg=2Ec
>@@ -14,7 +14,7 @@
> #include <linux/string=2Eh>
> #include <linux/wmi=2Eh>
> #include "bioscfg=2Eh"
>-#include "=2E=2E/=2E=2E/firmware_attributes_class=2Eh"
>+#include <linux/firmware_attributes=2Eh>
> #include <linux/nls=2Eh>
> #include <linux/errno=2Eh>
>=20
>diff --git a/drivers/platform/x86/lenovo/think-lmi=2Ec b/drivers/platform=
/x86/lenovo/think-lmi=2Ec
>index e215e86e3db7=2E=2Ea56f152b5f28 100644
>--- a/drivers/platform/x86/lenovo/think-lmi=2Ec
>+++ b/drivers/platform/x86/lenovo/think-lmi=2Ec
>@@ -20,7 +20,7 @@
> #include <linux/types=2Eh>
> #include <linux/dmi=2Eh>
> #include <linux/wmi=2Eh>
>-#include "=2E=2E/firmware_attributes_class=2Eh"
>+#include <linux/firmware_attributes=2Eh>
> #include "think-lmi=2Eh"
>=20
> static bool debug_support;
>diff --git a/drivers/platform/x86/lenovo/wmi-other=2Ec b/drivers/platform=
/x86/lenovo/wmi-other=2Ec
>index fbb32bf404f2=2E=2Ee9a2c4684e5f 100644
>--- a/drivers/platform/x86/lenovo/wmi-other=2Ec
>+++ b/drivers/platform/x86/lenovo/wmi-other=2Ec
>@@ -50,7 +50,7 @@
> #include "wmi-capdata=2Eh"
> #include "wmi-events=2Eh"
> #include "wmi-helpers=2Eh"
>-#include "=2E=2E/firmware_attributes_class=2Eh"
>+#include <linux/firmware_attributes=2Eh>
>=20
> #define LENOVO_OTHER_MODE_GUID "DC2A8805-3A8C-41BA-A6F7-092E0089CD3B"
>=20
>diff --git a/drivers/platform/x86/samsung-galaxybook=2Ec b/drivers/platfo=
rm/x86/samsung-galaxybook=2Ec
>index 6382af0b106c=2E=2E74b8c887dd79 100644
>--- a/drivers/platform/x86/samsung-galaxybook=2Ec
>+++ b/drivers/platform/x86/samsung-galaxybook=2Ec
>@@ -28,7 +28,7 @@
> #include <linux/uuid=2Eh>
> #include <linux/workqueue=2Eh>
> #include <acpi/battery=2Eh>
>-#include "firmware_attributes_class=2Eh"
>+#include <linux/firmware_attributes=2Eh>
>=20
> #define DRIVER_NAME "samsung-galaxybook"
>=20
>diff --git a/drivers/platform/x86/firmware_attributes_class=2Eh b/include=
/linux/firmware_attributes=2Eh
>similarity index 60%
>rename from drivers/platform/x86/firmware_attributes_class=2Eh
>rename to include/linux/firmware_attributes=2Eh
>index d27abe54fcf9=2E=2Ed4026ba1fcc2 100644
>--- a/drivers/platform/x86/firmware_attributes_class=2Eh
>+++ b/include/linux/firmware_attributes=2Eh
>@@ -2,11 +2,11 @@
>=20
> /* Firmware attributes class helper module */
>=20
>-#ifndef FW_ATTR_CLASS_H
>-#define FW_ATTR_CLASS_H
>+#ifndef _LINUX_FIRMWARE_ATTRIBUTES_H
>+#define _LINUX_FIRMWARE_ATTRIBUTES_H
>=20
> #include <linux/device/class=2Eh>
>=20
> extern const struct class firmware_attributes_class;
>=20
>-#endif /* FW_ATTR_CLASS_H */
>+#endif /* _LINUX_FIRMWARE_ATTRIBUTES_H */

