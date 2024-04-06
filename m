Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DFA217C8B
	for <chrome-platform@lists.linux.dev>; Sat,  6 Apr 2024 18:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712429292; cv=none; b=hiNIXqcc4PeVe7sEFwd+7gamLayakFJoI7diBd9GXf68vlPwIs6bY+i3zzEpt910ugwdzJ5VxtVt7BFuG3X8S/6YVkfSRfKWUIq1c0vjpbYljv4xhSLEPyKZwShpXj2nduc2ZP/+JNfzwpHJzjq6Gu9lyX+DaGhGQzbX5g6QNgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712429292; c=relaxed/simple;
	bh=uyyVZCRRlHE3yvXCPOkamifOc8Ep/cwbGZFMAjolR50=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=fHbCfF/qxYXpkieSwdrWYGT3TxATcCx2ixUISBpgwHgiRH+mcOy9cfr/yljiKPv/zGCohPlctKxA7s/mPlHUiNBapRFvnlRa6Qi6zUbNZfBRxmnwjXVysTloXQ9hRh5T81xuaU7ez9h+EPGk3y3WPWbXJDPat/I/QshuNJoGRk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aOLOK1pb; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aOLOK1pb"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3c3e2e0e407so2203487b6e.0
        for <chrome-platform@lists.linux.dev>; Sat, 06 Apr 2024 11:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712429289; x=1713034089; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9wm9Ph/3s5E3NASywLWaboSAvM58CF/JiHZRK7P0wK0=;
        b=aOLOK1pbgFtmQ93XCXkmB696G2pJZwkirtyuehTFFzgbnZo2TjXCSvBVue6NuTpUD8
         kPlVLajWyG6QIL7l4pOR5Pydpng+3f0R2lQxA+3Wnd0AZZcO8B9mhSygdO9fTuuxFyEw
         Qx9C2gKCgtzTDa7Nfc4rTaQibULYrvbI85nDYttACgyOu7CMGoBKCw7hwb6gmsrqyqc0
         PwKOjMMpR1ozfL0+oWFRhI1dtRuYjbW68+guV6HHd4XlW9IWRmK68lVDjvbKlf4+dL3t
         QxC+RgFb1HM+Ay8wSgsxnb+r2Kbt9qD+RBKmdoHBTKPuUtbEtohhAB37MfkcrR27U/ED
         IvzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712429289; x=1713034089;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9wm9Ph/3s5E3NASywLWaboSAvM58CF/JiHZRK7P0wK0=;
        b=uW7dfO6cMvsA8mfIgoP7EoRCGmoGxre8/ra2BZta+4lvCx2IPwT0AgRfPnkv1qvU//
         YBgzl+WV8d18b4ndYyTGSPYCvid5kCPISgyEBKhPZYs4qv2BHgM/zUUEa07sZXQ+fVRn
         7G17YYgt4yrZ+OsX9RDt0/g0CY3DF17j2mFgdVhGMUbf5j7vGrw+lARqcftfL2I95Jdr
         o13L/o5pYOYnA6OML8EboSPpZGAtJKTcxglHkpaNdRGhZsZgTSVfcDwFzZGX7OvhbBKP
         8mcH7BGLzqd+US7MJyI23JR2st6A96unufn51QSwDI8/cDqtWVvAW1klDC7qIoYz14CW
         1Rfg==
X-Forwarded-Encrypted: i=1; AJvYcCV4JhKjlwH8a2lx/F2h1DmYeZELD+HM0ff2VEvViaff32CJOb3A6Nns1OEY4Ntsdt6+4u4HeEoPbSO9V+MM9Tw4VCi13M2luoJRXkWNg6/D
X-Gm-Message-State: AOJu0YwStKMrtDKtqL+4zLw2ElPfKUXosy0dsxFsYBBedQIiEql+G1Xv
	n5gny2RMcF3eyz7NbFfWnKlbdHlII+NrSpY3SAI5RVkeO3vjdC7q
X-Google-Smtp-Source: AGHT+IFOahRer8HH/tw3qXPVwrJSvWLJbDEVykNF5GolU1BOrSv+htMv50kh1eRQMlAk26+uNUknNg==
X-Received: by 2002:a05:6870:e80f:b0:22a:919a:dc87 with SMTP id o15-20020a056870e80f00b0022a919adc87mr3431387oan.56.1712429289538;
        Sat, 06 Apr 2024 11:48:09 -0700 (PDT)
Received: from [192.168.20.112] (76-251-167-31.lightspeed.austtx.sbcglobal.net. [76.251.167.31])
        by smtp.gmail.com with ESMTPSA id wx24-20020a0568707e1800b0022e5019495esm1176794oab.25.2024.04.06.11.48.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Apr 2024 11:48:09 -0700 (PDT)
Message-ID: <84eafee2-150e-4711-9eb9-1a013f363332@gmail.com>
Date: Sat, 6 Apr 2024 13:48:08 -0500
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] platform/chrome: cros_ec_lpc: add support for AMD
 Framework Laptops
To: "Dustin L. Howett" <dustin@howett.net>, Tzung-Bi Shih
 <tzungbi@kernel.org>, Guenter Roeck <groeck@chromium.org>,
 chrome-platform@lists.linux.dev
References: <20231126192452.97824-1-dustin@howett.net>
 <20240403004713.130365-1-dustin@howett.net>
Content-Language: en-US
From: Mario Limonciello <superm1@gmail.com>
In-Reply-To: <20240403004713.130365-1-dustin@howett.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/2/24 19:47, Dustin L. Howett wrote:
> This patch series adds support for the AMD models of the Framework
> Laptop (both 13" and 16").
> 
> These models of Framework Laptop have switched to an NPCX embedded
> controller, which uses the original Chrome EC linear memory-mapped I/O
> model.
> 
> However, these devices are not configured in a way that is compatible
> with the cros_ec driver. Instead of mapping EC memory to I/O ports
> [0x900, 0x9FF], they map it to ports [0xE00, 0xEFF].
> 
> To address this difference without impacting cros_ec_lpcs' compatibility
> with Chromebook/Chromebox devices or the existing Framework Laptop
> platform, these patches add DMI match-specific driver data through which
> we can detect per-machine "quirks".
> 
> Quirks toggle changes in cros_ec_lpcs' behavior, such as remapping the
> memory MMIO window.
> 
> Changes in v2:
> * Separated Framework Laptop (Intel) and Framework Laptop (AMD)
> * dev_warn has been demoted to dev_info
> * Style fixes
> * Reworded the individual patch bodies for clarity and style
> 
> Changes in v3:
> * Addressed dev_warn feedback from Thomas Weissschuh
> * Removed the host command region quirk; Framework Computer is slated to
>    release a firmware update that addresses the I/O region issue from
>    this series' v1 and v2. This leaves just one quirk, with the potential
>    for future quirks (e.g. changes required to reduce EC bus contention
>    on the Intel Framework Laptops)
> 
> 
> Dustin L. Howett (4):
>    platform/chrome: cros_ec_lpc: introduce a priv struct for the lpc
>      device
>    platform/chrome: cros_ec_lpc: pass driver_data from DMI to the device
>    platform/chrome: cros_ec_lpc: add a "quirks" system
>    platform/chrome: cros_ec_lpc: add quirks for the Framework Laptop
>      (AMD)
> 
>   drivers/platform/chrome/cros_ec_lpc.c | 81 ++++++++++++++++++++++++---
>   1 file changed, 74 insertions(+), 7 deletions(-)
> 

I tested on top of a Framework 13 AMD running BIOS 03.05.

I found that there are some errors shown related to charging abilities 
for the PD controller.  Should cros-usbpd-charger support be quirked out 
when run on a FW laptop?

[    5.545352] cros-usbpd-charger cros-usbpd-charger.4.auto: No USB PD 
charging ports found
[    5.546722] cros-usbpd-charger cros-usbpd-charger.4.auto: Unexpected 
number of charge port count
[    5.546730] cros-usbpd-charger cros-usbpd-charger.4.auto: Failing 
probe (err:0xffffffb9)
[    5.546735] cros-usbpd-charger cros-usbpd-charger.4.auto: probe with 
driver cros-usbpd-charger failed with error -71
