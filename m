Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC26F367B7B
	for <chrome-platform@lists.linux.dev>; Mon, 13 Jul 2026 07:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783926786; cv=none; b=KEaBUSlQ+UI34+yjVrg5FCHBtUnQjCm/v9Nh3bO3ysu1a3s2ZH3zhJmwvXn5zDby60Mr989ZwCthiijQli625YBh5vWzGWb/85dZ2LB4o0ej0eQroT+TjD2uYAUEKw5Kvjoy9EoLVQJ7y6GIbV/zDraQytAWOKyMR3CSgmRqDFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783926786; c=relaxed/simple;
	bh=LUVeQgY4o0fHQ8xIX//qTWXkFdlOyUCh2BjZdKIA+wY=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=MSwqW8KVkEy2fEEPbGS0Bst7DoewMQiolZZQbrxgBgCllT91b7gwafT2IsZT/kPhvT6wAYeITOfOweC4M2LidNdyPD5EgXCYPbYDTe2sgI1RMLyH4OHm2LhV77nAv4WDUUDT8dVZhqyB94xMC7NIoThWZ6DI71pOQJ9YuJZ/BMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bV1Qx28Y; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bV1Qx28Y"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38101f85591so2722579a91.1
        for <chrome-platform@lists.linux.dev>; Mon, 13 Jul 2026 00:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783926783; x=1784531583; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=VIUlyELxeJZwAwkpOsl3GB2D82CzRM+HS3x5FJxMKtI=;
        b=bV1Qx28YXiGro6Fw9PMnr2FAuA/c35j5zb/TonK/CYPjh7+XB/CFiE51OB5Un0HkEb
         xiZVwVdIMKnaadmmqCGCZh2oSrhuwuzGCvI/4W3dXq8udPBWqDTmhmjAluczRuIaaI/8
         roFRkNGXwjMUZ6rd7Xa/yQcFs8L6AfUTIGbMCojCu84hkxX98xGj/Ar56ES4XSxBHbrO
         pcRl8Ef7t7S/vgeCO6cj+fMd98ljzfYTHNrHcZb2K3AG1EWB06vrOWDFk7hsl5ZZDiTe
         GqvqoL/7ImsVZFdSzHzsEGUIYzsOpPgKPgkxndNiYvZSGRUh8IppqiZD4BBt8YyrsoH7
         HwyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783926783; x=1784531583;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VIUlyELxeJZwAwkpOsl3GB2D82CzRM+HS3x5FJxMKtI=;
        b=g1BeFrSdMxfKYQgmFnG3PiqNEQ9aINd9Qq7EpaXf3tmefrMGF4EKqdxa6FQD0Rx8B2
         +BBWPqSwnslnJwhWSn9ByYiDaxVXmjkYIDN3/DdLQWIxLL0VLZj1nQSO6jHlmfU5vEK9
         EgsV9aVR0tvy7Ei57trv8wJk+O4u/lGcaeaSmPPDFdCBlz0G/dlFUrOcS4Q7m1pilQKV
         z3aesm/BOfWsemqCDXDKxINeGA99A+YV+K2JthGJ9YUVBss7eDG4Otc4cw0m9AA27HGx
         CHPusZqpn2RqNI32DEAyAhiOJyqIpgMETrc8uNJO9m2c3yUpQbxGWnm3hpT1RwRi4mi+
         PHGQ==
X-Forwarded-Encrypted: i=1; AHgh+RolWlN+ExkJ2A1A0lxwC39RNe76k/d+M1fj8JgRS3TRs8mtnb3WrcmteJCG2m2OIVrUH/iP2kEsFfqtsnGF+hQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YzBdcsEGJEgawZ+8k55vA5gVHnMXO6jyp+GGRipH9TuigMwHBmE
	0gxkt4c6BgYIBWa2IJMze5PofE1q/+pSrUb/Lj4QgU9U05kxb3l24HD1
X-Gm-Gg: AfdE7ckfdvjy1PPzpfY1kdNI9k7CNZWMKK2TTYMyM4J6fRvOslFBhBtVrgOYRWU5WNk
	eEEL6kL4X+mub1ma3usje/XYnY8TfrOqs1eV18BaOzqfSVcTHM1snkak2+Uats/nVwIvs6jXrWV
	qZOd4PpLXhuON97AiP5QVmgz+0sXqFmsg1betML2Lvik1lXp+WqF5iF81KNTo7bm/6uUPi+NHsB
	a6tps6UBu3PpSN9MITTeGVMVSmwey+AyZR2mxBsOaMekIv0t4wvy93MTwhQT/QVJD7z6vlgTP7z
	FLhDpZcCIcyjPXh6DYy1zJ6zJR0/G3oGD9GTnDJMYd7LIiSif1av6ylYAJaaOCqd938Q3czlMc/
	D9lf5VU7oUIkQeqoiEDICjzc6JIVMQMcNAn8ciLLsff3Ysk2SiA4k3hUPdkuU/qnQA7xKlOPat1
	zx4bdDZU3VS0OuniJKTSkWniUYwe1RhN3bxmIXrvNQBHXIW3gYpUQOpZYdreIOZsx69yQP9Ikj
X-Received: by 2002:a17:90b:2248:b0:37f:fd70:6790 with SMTP id 98e67ed59e1d1-38dc81c1b09mr5704556a91.9.1783926782987;
        Mon, 13 Jul 2026 00:13:02 -0700 (PDT)
Received: from ehlo.thunderbird.net (221x252x203x146.ap221.ftth.ucom.ne.jp. [221.252.203.146])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38dc9fc78ffsm2825228a91.9.2026.07.13.00.13.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 00:13:02 -0700 (PDT)
Date: Mon, 13 Jul 2026 16:13:00 +0900
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Sean Rhodes <sean@starlabs.systems>, tzungbi@kernel.org
CC: hansg@kernel.org, ilpo.jarvinen@linux.intel.com, corentin.chary@gmail.com,
 luke@ljones.dev, denis.benato@linux.dev, prasanth.ksr@dell.com,
 jorge.lopez2@hp.com, mpearson-lenovo@squebb.ca, josh@joshuagrisham.com,
 briannorris@chromium.org, jwerner@chromium.org, tzimmermann@suse.de,
 javierm@redhat.com, kees@kernel.org, u.kleine-koenig@baylibre.com,
 mst@redhat.com, chenhuacai@kernel.org, wenst@chromium.org,
 florian.fainelli@broadcom.com, titouan.ameline@gmail.com,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 Dell.Client.Kernel@dell.com, chrome-platform@lists.linux.dev
Subject: Re: [PATCH v5 1/3] firmware: Move firmware attributes class helper
User-Agent: Thunderbird for Android
In-Reply-To: <20260713054526.2902319-2-sean@starlabs.systems>
References: <CABtds-0uN8WW2SkDzwYf8cbQGZnx=Y8Nocs-ebMYB0KWOiX_Kw@mail.gmail.com> <20260713054526.2902319-1-sean@starlabs.systems> <20260713054526.2902319-2-sean@starlabs.systems>
Message-ID: <08F19E6F-35B6-470A-A156-D6CB96326DD5@gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On July 13, 2026 2:45:24 PM GMT+09:00, Sean Rhodes <sean@starlabs=2Esystems=
> wrote:
>Move the firmware attributes class helper from drivers/platform/x86 to
>drivers/firmware and expose its class declaration through a public Linux
>header=2E
>
>The helper is not x86-specific=2E Keeping it in firmware lets coreboot
>firmware drivers use the standard firmware-attributes ABI without living
>under platform/x86=2E
>
>Reviewed-by: Mark Pearson <mpearson-lenovo@squebb=2Eca>
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

Hi Sean,

With this moving from a relative file path include to a full Linux header =
include, it should be moved up to be with the other header includes above (=
in alphabetical order)=2E

Applies to all drivers below as well=2E

With those changes,

Reviewed-by: Derek J=2E Clark <derekjohn=2Eclark@gmail=2Ecom>

Thanks,
Derek


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

