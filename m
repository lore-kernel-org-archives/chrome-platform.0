Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5D63D9DD2
	for <chrome-platform@lists.linux.dev>; Mon, 13 Jul 2026 09:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783936423; cv=none; b=VI4+PyL6Qlz/c0FlJe3LrAFjmPNRoDn/A9wC/EDug+l3WL/XMZIh2oQdbPnX7p9LTmZKoWRx0BXK80MY+6jtghiWAGHSvZYUhI3MWkxT4MujPuZLa/mSVm+x3rg+SB4panwPvoHo/XP3yw5Ceer6HT8+9fwnu26vemzHI9v2XxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783936423; c=relaxed/simple;
	bh=kngE0lL648nAyvUh0+iYcyckbgYing28fV2SNdT9oOc=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=cyCAqr7DUpcG5hoZ10Edd9OdS/gBvIfkny4W5YtNVsQlYu84DyNR+so61diGURTI9rhs8MuX3eYNfv9Mi5boG58IrsSkF6tkw69hounu6ZmhYNKW5WFUX5m/hvN8yn1kQKWNibocHcbl3AqLv4XUzFEoRyjJNyM2F90j7KFoCEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nkj5bz7k; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nkj5bz7k"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8487b7b4066so2501062b3a.1
        for <chrome-platform@lists.linux.dev>; Mon, 13 Jul 2026 02:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783936420; x=1784541220; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=dGOSO8sGjHKjdBRL+JsTb/fGsqegAWj+oEAzRJ22a0A=;
        b=Nkj5bz7kzZZQhgf11PgHu35DaSumXxHkccVq3W+KQAMj3eCIbC2Ay0eaW3kmL3Po6E
         MpxP31llGhT6AT3u+pAvIcVv6g9T16mrnuuA7bg43BW9sIJO6ZmYwcIwsHIS0hLpzCzE
         XL4F8Mi/0YiL5XIGVtqiIle9uJgzX3DXWg4RLYmDUKpLojwrKSsgmVjn+ttSSdPrafxN
         /9T3johtArsfHalUBBCNL3LwgPkLBn4IFJEnapY6JSwjPMUo66pvKv3Kc4AaG3CALSJD
         sPeJUwISaxP058ac1BFlMcVoxL6CrOwcaKojZw87E1IfJfMv13h5cqT1T2dL5OpwsQlG
         HfrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783936420; x=1784541220;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dGOSO8sGjHKjdBRL+JsTb/fGsqegAWj+oEAzRJ22a0A=;
        b=Xt7RNB1vLsHu91JLsw8c6K2WYsmsHf6yLy0mClwnTixJCSB8AO6Eag/2CYYQUiv7m+
         einGe+jZXNPBR1tsXMS1FuxjY2ti7nGN1ntuGxOGCo8YKEukqtFp0FgBX9orAcuADGvt
         wteitdWu8s6KY7lsS0pgTV+je3UJcWCOCNlaTLkEiAhWI8pnXj8iQh/YXtC2aeS81QyF
         rOpBeFP4PbPtaMwcFJSgiYhxCfz73irteo9TuUoVhNco3VAW1ejcD7oWuCHhZ0NROsbD
         r08+U2jiQmvrk6PwdMCWC3zfZK8Z5P/I2Wwq6JdMJ5U1pBAGIYYiThydIHlyWDA7T7X5
         HDZg==
X-Forwarded-Encrypted: i=1; AHgh+RqqiLtr+Im23gYVzRTk8JXEv9bFvl7/BHiuyl83c/NYDuiwzC/EiXRPUgPC0gwqXJ4OiFouXuCPyMhZpBcpAYc=@lists.linux.dev
X-Gm-Message-State: AOJu0YwNcn0gcYfEr6reaZFtpizh81OsJsQFtzGYYJ0dYIpCgVornl6D
	dsrHh6I8PqQE50U50DJwxIo5ji5V+J+RPpMSLuqiyi+UUHb5L1ciMc+Y
X-Gm-Gg: AfdE7cngkPvbt8QX+CP5M+j2FhPD74cmef6wc+n3kqTmJ8j4oQEPZgbIeJR+Ll8TGro
	qzzXPDZenTKqjGuxTvJFvo8TSJSRIsgJIyCDyOFl/ve5+aKESqv6qMY/NTb1cmPbTM5iuk0BPmt
	1zpLFV0uFb6mDxM60J34BzdJUTR1VQbSFjDmzZU6Ju2fny89HdlN7qnIH0of4JsPdqH4vAAEtMO
	Zea2M5X5aIUdNyp5wSQHAMK5NDAA8CIiOPPK5uG3gZVfeqVHtbBJz8pmLkxDATMb6hiNA7a3d0R
	1MyS5fg3P+/qDTb8VTKPwspDRXMvoz7Rx7u2/QhbW8dI0ZmIOAFhHkRD9NKT17hN4bYVFVmlmSO
	IsgGZUIjeqVyTrbDf79Qu874Vt+82GhSLA0cuLMrSDKfBHdFo01QA0Uy4FB0a0X0hM0h8z0EeI7
	YTO9gXYFWwZdVH+Bclar9wN5JRNeF4lKQgVmLb5OszLMm1qiV9/qN+Yt5MeSZgApsrfbrZIwwh
X-Received: by 2002:a05:6a00:f08:b0:848:4859:a45 with SMTP id d2e1a72fcca58-848895dc4b9mr7927348b3a.2.1783936419975;
        Mon, 13 Jul 2026 02:53:39 -0700 (PDT)
Received: from ehlo.thunderbird.net (221x252x203x146.ap221.ftth.ucom.ne.jp. [221.252.203.146])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84870d76ce7sm4796626b3a.55.2026.07.13.02.53.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 02:53:39 -0700 (PDT)
Date: Mon, 13 Jul 2026 18:53:36 +0900
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
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v6_0/3=5D_firmware=3A_Add_cor?=
 =?US-ASCII?Q?eboot_CFR_firmware_attributes_driver?=
User-Agent: Thunderbird for Android
In-Reply-To: <20260713081317.2954586-1-sean@starlabs.systems>
References: <20260713054526.2902319-1-sean@starlabs.systems> <20260713081317.2954586-1-sean@starlabs.systems>
Message-ID: <32F6BAAE-9BC8-42BA-9F1A-51AB3EADDBE7@gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On July 13, 2026 5:13:14 PM GMT+09:00, Sean Rhodes <sean@starlabs=2Esystems=
> wrote:
>Move the firmware attributes class helper out of platform/x86, rename
>the coreboot-table firmware driver directory from google to coreboot, and
>add a coreboot CFR firmware attributes driver=2E
>
>Changes in v6:
>- Move firmware_attributes=2Eh into the sorted Linux include block in eac=
h
>  converted platform/x86 driver=2E
>- Add Derek's Reviewed-by to patch 1=2E
>

Hi Sean,

Generally you will want to give a bit more time between revisions to allow=
 people to review=2E 1-2 days during the work week is usually the acceptabl=
e minimum time between versions=2E Sending too frequently can cause people =
to review older patches without noticing the same issue was already identif=
ied/fixed later and nobody wants to read the same patch 4 times in a row on=
 a Monday=2E

Cheers,
- Derek


>Sean Rhodes (3):
>  firmware: Move firmware attributes class helper
>  firmware: Rename google firmware directory to coreboot
>  firmware: coreboot: Add CFR firmware attributes driver
>
> MAINTAINERS                                   |   18 +-
> drivers/firmware/Kconfig                      |    5 +-
> drivers/firmware/Makefile                     |    3 +-
> drivers/firmware/{google =3D> coreboot}/Kconfig |   19 +-
> =2E=2E=2E/firmware/{google =3D> coreboot}/Makefile    |    1 +
> drivers/firmware/{google =3D> coreboot}/cbmem=2Ec |    0
> drivers/firmware/coreboot/coreboot-cfr=2Ec      | 1065 +++++++++++++++++
> =2E=2E=2E/{google =3D> coreboot}/coreboot_table=2Ec     |    0
> =2E=2E=2E/{google =3D> coreboot}/coreboot_table=2Eh     |    0
> =2E=2E=2E/framebuffer-coreboot=2Ec                    |    0
> drivers/firmware/{google =3D> coreboot}/gsmi=2Ec  |    0
> =2E=2E=2E/memconsole-coreboot=2Ec                     |    0
> =2E=2E=2E/memconsole-x86-legacy=2Ec                   |    0
> =2E=2E=2E/{google =3D> coreboot}/memconsole=2Ec         |    0
> =2E=2E=2E/{google =3D> coreboot}/memconsole=2Eh         |    6 +-
> drivers/firmware/{google =3D> coreboot}/vpd=2Ec   |    0
> =2E=2E=2E/{google =3D> coreboot}/vpd_decode=2Ec         |    0
> =2E=2E=2E/{google =3D> coreboot}/vpd_decode=2Eh         |    0
> =2E=2E=2E/firmware_attributes_class=2Ec               |    2 +-
> drivers/platform/x86/Kconfig                  |    3 -
> drivers/platform/x86/Makefile                 |    2 -
> drivers/platform/x86/asus-armoury=2Ec           |    2 +-
> =2E=2E=2E/x86/dell/dell-wmi-sysman/sysman=2Ec         |    9 +-
> drivers/platform/x86/hp/hp-bioscfg/bioscfg=2Ec  |    9 +-
> drivers/platform/x86/lenovo/think-lmi=2Ec       |    5 +-
> drivers/platform/x86/lenovo/wmi-other=2Ec       |    2 +-
> drivers/platform/x86/samsung-galaxybook=2Ec     |    3 +-
> =2E=2E=2E/linux/firmware_attributes=2Eh               |    6 +-
> 28 files changed, 1128 insertions(+), 32 deletions(-)
> rename drivers/firmware/{google =3D> coreboot}/Kconfig (83%)
> rename drivers/firmware/{google =3D> coreboot}/Makefile (92%)
> rename drivers/firmware/{google =3D> coreboot}/cbmem=2Ec (100%)
> create mode 100644 drivers/firmware/coreboot/coreboot-cfr=2Ec
> rename drivers/firmware/{google =3D> coreboot}/coreboot_table=2Ec (100%)
> rename drivers/firmware/{google =3D> coreboot}/coreboot_table=2Eh (100%)
> rename drivers/firmware/{google =3D> coreboot}/framebuffer-coreboot=2Ec =
(100%)
> rename drivers/firmware/{google =3D> coreboot}/gsmi=2Ec (100%)
> rename drivers/firmware/{google =3D> coreboot}/memconsole-coreboot=2Ec (=
100%)
> rename drivers/firmware/{google =3D> coreboot}/memconsole-x86-legacy=2Ec=
 (100%)
> rename drivers/firmware/{google =3D> coreboot}/memconsole=2Ec (100%)
> rename drivers/firmware/{google =3D> coreboot}/memconsole=2Eh (82%)
> rename drivers/firmware/{google =3D> coreboot}/vpd=2Ec (100%)
> rename drivers/firmware/{google =3D> coreboot}/vpd_decode=2Ec (100%)
> rename drivers/firmware/{google =3D> coreboot}/vpd_decode=2Eh (100%)
> rename drivers/{platform/x86 =3D> firmware}/firmware_attributes_class=2E=
c (94%)
> rename drivers/platform/x86/firmware_attributes_class=2Eh =3D> include/l=
inux/firmware_attributes=2Eh (60%)
>
>Range-diff against v5:
>1:  4a82d0a07612 ! 1:  02edc6d05059 firmware: Move firmware attributes cl=
ass helper
>    @@ Commit message
>         under platform/x86=2E
>    =20
>         Reviewed-by: Mark Pearson <mpearson-lenovo@squebb=2Eca>
>    +    Reviewed-by: Derek J=2E Clark <derekjohn=2Eclark@gmail=2Ecom>
>         Signed-off-by: Sean Rhodes <sean@starlabs=2Esystems>
>    =20
>      ## MAINTAINERS ##
>    @@ drivers/platform/x86/Makefile: obj-$(CONFIG_X86_PLATFORM_DRIVERS_H=
P)	+=3D hp/
>      obj-$(CONFIG_SENSORS_HDAPS)	+=3D hdaps=2Eo
>    =20
>      ## drivers/platform/x86/asus-armoury=2Ec ##
>    +@@
>    + #include <linux/dmi=2Eh>
>    + #include <linux/err=2Eh>
>    + #include <linux/errno=2Eh>
>    ++#include <linux/firmware_attributes=2Eh>
>    + #include <linux/fs=2Eh>
>    + #include <linux/kernel=2Eh>
>    + #include <linux/kmod=2Eh>
>     @@
>      #include <linux/sysfs=2Eh>
>     =20
>      #include "asus-armoury=2Eh"
>     -#include "firmware_attributes_class=2Eh"
>    -+#include <linux/firmware_attributes=2Eh>
>     =20
>      #define ASUS_NB_WMI_EVENT_GUID "0B3CBB35-E3C2-45ED-91C2-4C5A6D195D1=
C"
>     =20
>    =20
>      ## drivers/platform/x86/dell/dell-wmi-sysman/sysman=2Ec ##
>     @@
>    + #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>    +=20
>    + #include <linux/align=2Eh>
>    +-#include <linux/fs=2Eh>
>    + #include <linux/dmi=2Eh>
>    +-#include <linux/module=2Eh>
>    ++#include <linux/firmware_attributes=2Eh>
>    ++#include <linux/fs=2Eh>
>    + #include <linux/kernel=2Eh>
>    ++#include <linux/module=2Eh>
>    ++#include <linux/nls=2Eh>
>    + #include <linux/string=2Eh>
>      #include <linux/sysfs=2Eh>
>      #include <linux/wmi=2Eh>
>    ++
>      #include "dell-wmi-sysman=2Eh"
>     -#include "=2E=2E/=2E=2E/firmware_attributes_class=2Eh"
>    -+#include <linux/firmware_attributes=2Eh>
>     =20
>      #define MAX_TYPES  4
>    - #include <linux/nls=2Eh>
>    +-#include <linux/nls=2Eh>
>    +=20
>    + struct wmi_sysman_priv wmi_priv =3D {
>    + 	=2Emutex =3D __MUTEX_INITIALIZER(wmi_priv=2Emutex),
>    =20
>      ## drivers/platform/x86/hp/hp-bioscfg/bioscfg=2Ec ##
>     @@
>    +=20
>    + #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>    +=20
>    ++#include <linux/errno=2Eh>
>    ++#include <linux/firmware_attributes=2Eh>
>    + #include <linux/fs=2Eh>
>    +-#include <linux/module=2Eh>
>    + #include <linux/kernel=2Eh>
>    ++#include <linux/module=2Eh>
>    ++#include <linux/nls=2Eh>
>    + #include <linux/printk=2Eh>
>      #include <linux/string=2Eh>
>      #include <linux/wmi=2Eh>
>    ++
>      #include "bioscfg=2Eh"
>     -#include "=2E=2E/=2E=2E/firmware_attributes_class=2Eh"
>    -+#include <linux/firmware_attributes=2Eh>
>    - #include <linux/nls=2Eh>
>    - #include <linux/errno=2Eh>
>    +-#include <linux/nls=2Eh>
>    +-#include <linux/errno=2Eh>
>     =20
>    + MODULE_AUTHOR("Jorge Lopez <jorge=2Elopez2@hp=2Ecom>");
>    + MODULE_DESCRIPTION("HP BIOS Configuration Driver");
>    =20
>      ## drivers/platform/x86/lenovo/think-lmi=2Ec ##
>     @@
>    +=20
>    + #include <linux/acpi=2Eh>
>    + #include <linux/array_size=2Eh>
>    ++#include <linux/dmi=2Eh>
>    + #include <linux/errno=2Eh>
>    ++#include <linux/firmware_attributes=2Eh>
>    + #include <linux/fs=2Eh>
>    + #include <linux/mutex=2Eh>
>    + #include <linux/string_helpers=2Eh>
>      #include <linux/types=2Eh>
>    - #include <linux/dmi=2Eh>
>    +-#include <linux/dmi=2Eh>
>      #include <linux/wmi=2Eh>
>     -#include "=2E=2E/firmware_attributes_class=2Eh"
>    -+#include <linux/firmware_attributes=2Eh>
>    ++
>      #include "think-lmi=2Eh"
>     =20
>      static bool debug_support;
>    =20
>      ## drivers/platform/x86/lenovo/wmi-other=2Ec ##
>    +@@
>    + #include <linux/container_of=2Eh>
>    + #include <linux/device=2Eh>
>    + #include <linux/export=2Eh>
>    ++#include <linux/firmware_attributes=2Eh>
>    + #include <linux/gfp_types=2Eh>
>    + #include <linux/hwmon=2Eh>
>    + #include <linux/idr=2Eh>
>     @@
>      #include "wmi-capdata=2Eh"
>      #include "wmi-events=2Eh"
>      #include "wmi-helpers=2Eh"
>     -#include "=2E=2E/firmware_attributes_class=2Eh"
>    -+#include <linux/firmware_attributes=2Eh>
>     =20
>      #define LENOVO_OTHER_MODE_GUID "DC2A8805-3A8C-41BA-A6F7-092E0089CD3=
B"
>     =20
>    =20
>      ## drivers/platform/x86/samsung-galaxybook=2Ec ##
>     @@
>    + #include <linux/acpi=2Eh>
>    + #include <linux/bits=2Eh>
>    + #include <linux/err=2Eh>
>    ++#include <linux/firmware_attributes=2Eh>
>    + #include <linux/i8042=2Eh>
>    + #include <linux/init=2Eh>
>    + #include <linux/input=2Eh>
>    +@@
>    + #include <linux/sysfs=2Eh>
>      #include <linux/uuid=2Eh>
>      #include <linux/workqueue=2Eh>
>    ++
>      #include <acpi/battery=2Eh>
>     -#include "firmware_attributes_class=2Eh"
>    -+#include <linux/firmware_attributes=2Eh>
>     =20
>      #define DRIVER_NAME "samsung-galaxybook"
>     =20
>2:  285b33f805dc =3D 2:  d5d3d1334994 firmware: Rename google firmware di=
rectory to coreboot
>3:  ce91f4da5510 =3D 3:  7a65c6b0e631 firmware: coreboot: Add CFR firmwar=
e attributes driver

