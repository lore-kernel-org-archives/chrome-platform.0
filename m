Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B583DAAD8
	for <chrome-platform@lists.linux.dev>; Fri, 24 Jul 2026 08:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784882175; cv=none; b=Fp7+4lI38uC2xMDYlI9D428mqcaMyC4Xz/oL+z1zLppxXrrY6LjvpUcY0rjoOWLXp5If6IqA4P8E28N2yEPVuiQyqJdgwDwUJGhlqtsfthnIeENLWtt2tCMip0q4D+SnZz/abIEH0jZHXoUGl0TY6Wlyqgu6JmKwNsvC1iLvDP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784882175; c=relaxed/simple;
	bh=2m27K8YDA2d3oCx+0nulJY0uzC0LDomgZgzJ9anfsnE=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=LkM1pMJAgWVb3NLpk2z309Gavy4Dqat8yQFZCb/HQnfa5qFV8pW9SAMvKvKC4wizM2Ba57iK2MubPn/6/dWZ9Ab4jVQlzkewOt0PPL9WXH8lXL7CDw8O+B62lnMdoORb/+rTLeh3RLLYPKe7VcZ5PTbBCjg5uzhCNf+5AaovhqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mO4ufsmd; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mO4ufsmd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784882171; x=1816418171;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=2m27K8YDA2d3oCx+0nulJY0uzC0LDomgZgzJ9anfsnE=;
  b=mO4ufsmdplgO5Dk/TimiwhDuB1XcbGnCHT2faJ5fXE96B18jWFwGA4kb
   Pr0UAWK4zNAZEyBLb2dHIXKDnFrniko0vH8C6l7JaA9SJ5iqttR5cPMcB
   fH7yzss7/YviUnCWOn5Hs50UZP3jQLT8kqEpsa8X4oO0OUZf4tUgKiot2
   2idI13CU+dMY6MDaWEQWqvMnlGItXnNS9Pzd3ddTaXuu8nXn5Li3q0Qe1
   iQfDheDjeoEl1YH9JTVbI86/Q/YhRlX1wnF8a0qnNDQNwiK+V/J0MfXOv
   vYVkaR3OQdiY/IsxN53t1R4f2gw2K+Uw14tofOqZBgAmW069Fw8++2PRS
   g==;
X-CSE-ConnectionGUID: nHgyqllpSYqFNBILNe3u9w==
X-CSE-MsgGUID: Fq+h+t6DTi+PRouuzNM4ZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="89437724"
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; 
   d="scan'208";a="89437724"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2026 01:36:05 -0700
X-CSE-ConnectionGUID: PWfznRuFRFSHbos9XEK9iw==
X-CSE-MsgGUID: K46nMSzBQGe8BkQ8EFXI2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; 
   d="scan'208";a="281959926"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.8])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2026 01:35:56 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 24 Jul 2026 11:35:52 +0300 (EEST)
To: Sean Rhodes <sean@starlabs.systems>
cc: tzungbi@kernel.org, Hans de Goede <hansg@kernel.org>, 
    corentin.chary@gmail.com, luke@ljones.dev, denis.benato@linux.dev, 
    prasanth.ksr@dell.com, jorge.lopez2@hp.com, 
    Mark Pearson <mpearson-lenovo@squebb.ca>, derekjohn.clark@gmail.com, 
    josh@joshuagrisham.com, briannorris@chromium.org, jwerner@chromium.org, 
    tzimmermann@suse.de, javierm@redhat.com, kees@kernel.org, 
    u.kleine-koenig@baylibre.com, mst@redhat.com, chenhuacai@kernel.org, 
    wenst@chromium.org, florian.fainelli@broadcom.com, 
    titouan.ameline@gmail.com, oliver@liuxiaozhen.dev, 
    LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, 
    Dell.Client.Kernel@dell.com, chrome-platform@lists.linux.dev
Subject: Re: [PATCH v8 1/4] platform/x86: Sort firmware attributes class
 includes
In-Reply-To: <CABtds-3mgwnoV8P4nVFfro2v99_MfVomm4Uz5JyxuVAK=cfY-Q@mail.gmail.com>
Message-ID: <2fa8bf8d-162d-db04-a85a-5f591fee447b@linux.intel.com>
References: <CABtds-3mgwnoV8P4nVFfro2v99_MfVomm4Uz5JyxuVAK=cfY-Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 22 Jul 2026, Sean Rhodes wrote:

> Move firmware_attributes_class.h into the main include block and sort the
> affected includes. This lets the header move replace each include in place.
> 
> Suggested-by: Derek J. Clark <derekjohn.clark@gmail.com>
> Signed-off-by: Sean Rhodes <sean@starlabs.systems>
> ---
>  drivers/platform/x86/asus-armoury.c                | 2 +-
>  drivers/platform/x86/dell/dell-wmi-sysman/sysman.c | 9 +++++----
>  drivers/platform/x86/hp/hp-bioscfg/bioscfg.c       | 9 +++++----
>  drivers/platform/x86/lenovo/think-lmi.c            | 5 +++--
>  drivers/platform/x86/lenovo/wmi-other.c            | 2 +-
>  drivers/platform/x86/samsung-galaxybook.c          | 3 ++-
>  6 files changed, 17 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/platform/x86/asus-armoury.c
> b/drivers/platform/x86/asus-armoury.c
> index 495dc1e31d40..f3d8c5a85762 100644
> --- a/drivers/platform/x86/asus-armoury.c
> +++ b/drivers/platform/x86/asus-armoury.c
> @@ -20,6 +20,7 @@
>  #include <linux/dmi.h>
>  #include <linux/err.h>
>  #include <linux/errno.h>
> +#include "firmware_attributes_class.h"
>  #include <linux/fs.h>
>  #include <linux/kernel.h>
>  #include <linux/kmod.h>
> @@ -34,7 +35,6 @@
>  #include <linux/sysfs.h>
> 
>  #include "asus-armoury.h"
> -#include "firmware_attributes_class.h"
> 
>  #define ASUS_NB_WMI_EVENT_GUID "0B3CBB35-E3C2-45ED-91C2-4C5A6D195D1C"
> 
> diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
> b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
> index ab46a023cc34..4ff9003c6589 100644
> --- a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
> +++ b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
> @@ -8,18 +8,19 @@
>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> 
>  #include <linux/align.h>
> -#include <linux/fs.h>
>  #include <linux/dmi.h>
> -#include <linux/module.h>
> +#include "../../firmware_attributes_class.h"
> +#include <linux/fs.h>
>  #include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/nls.h>
>  #include <linux/string.h>
>  #include <linux/sysfs.h>
>  #include <linux/wmi.h>
> +
>  #include "dell-wmi-sysman.h"
> -#include "../../firmware_attributes_class.h"

I'm sorry I probably wasn't specific enough with my comment but the 
custom is to have the local includes separately in own block of includes 
(empty line in between).

Also, if there's a case where there is's linux/xx.h and 
someotherfolder/xx.h, those should be in own "blocks" of include, each 
group sorted alphabetically.

--
 i.

>  #define MAX_TYPES  4
> -#include <linux/nls.h>
> 
>  struct wmi_sysman_priv wmi_priv = {
>  	.mutex = __MUTEX_INITIALIZER(wmi_priv.mutex),
> diff --git a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
> b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
> index 27fd6cd21529..1965a329be48 100644
> --- a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
> +++ b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
> @@ -7,16 +7,17 @@
> 
>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> 
> +#include <linux/errno.h>
> +#include "../../firmware_attributes_class.h"
>  #include <linux/fs.h>
> -#include <linux/module.h>
>  #include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/nls.h>
>  #include <linux/printk.h>
>  #include <linux/string.h>
>  #include <linux/wmi.h>
> +
>  #include "bioscfg.h"
> -#include "../../firmware_attributes_class.h"
> -#include <linux/nls.h>
> -#include <linux/errno.h>
> 
>  MODULE_AUTHOR("Jorge Lopez <jorge.lopez2@hp.com>");
>  MODULE_DESCRIPTION("HP BIOS Configuration Driver");
> diff --git a/drivers/platform/x86/lenovo/think-lmi.c
> b/drivers/platform/x86/lenovo/think-lmi.c
> index e215e86e3db7..9e4b3e973de9 100644
> --- a/drivers/platform/x86/lenovo/think-lmi.c
> +++ b/drivers/platform/x86/lenovo/think-lmi.c
> @@ -13,14 +13,15 @@
> 
>  #include <linux/acpi.h>
>  #include <linux/array_size.h>
> +#include <linux/dmi.h>
>  #include <linux/errno.h>
> +#include "../firmware_attributes_class.h"
>  #include <linux/fs.h>
>  #include <linux/mutex.h>
>  #include <linux/string_helpers.h>
>  #include <linux/types.h>
> -#include <linux/dmi.h>
>  #include <linux/wmi.h>
> -#include "../firmware_attributes_class.h"
> +
>  #include "think-lmi.h"
> 
>  static bool debug_support;
> diff --git a/drivers/platform/x86/lenovo/wmi-other.c
> b/drivers/platform/x86/lenovo/wmi-other.c
> index fbb32bf404f2..fdebaa0a9992 100644
> --- a/drivers/platform/x86/lenovo/wmi-other.c
> +++ b/drivers/platform/x86/lenovo/wmi-other.c
> @@ -33,6 +33,7 @@
>  #include <linux/container_of.h>
>  #include <linux/device.h>
>  #include <linux/export.h>
> +#include "../firmware_attributes_class.h"
>  #include <linux/gfp_types.h>
>  #include <linux/hwmon.h>
>  #include <linux/idr.h>
> @@ -50,7 +51,6 @@
>  #include "wmi-capdata.h"
>  #include "wmi-events.h"
>  #include "wmi-helpers.h"
> -#include "../firmware_attributes_class.h"
> 
>  #define LENOVO_OTHER_MODE_GUID "DC2A8805-3A8C-41BA-A6F7-092E0089CD3B"
> 
> diff --git a/drivers/platform/x86/samsung-galaxybook.c
> b/drivers/platform/x86/samsung-galaxybook.c
> index 6382af0b106c..74103c00b0c8 100644
> --- a/drivers/platform/x86/samsung-galaxybook.c
> +++ b/drivers/platform/x86/samsung-galaxybook.c
> @@ -14,6 +14,7 @@
>  #include <linux/acpi.h>
>  #include <linux/bits.h>
>  #include <linux/err.h>
> +#include "firmware_attributes_class.h"
>  #include <linux/i8042.h>
>  #include <linux/init.h>
>  #include <linux/input.h>
> @@ -27,8 +28,8 @@
>  #include <linux/sysfs.h>
>  #include <linux/uuid.h>
>  #include <linux/workqueue.h>
> +
>  #include <acpi/battery.h>
> -#include "firmware_attributes_class.h"
> 
>  #define DRIVER_NAME "samsung-galaxybook"
> 
> 
