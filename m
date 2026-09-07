Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A41E43C061
	for <chrome-platform@lists.linux.dev>; Mon,  7 Sep 2026 09:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788772952; cv=pass; b=eDM661fII54w7eT7iED7iJ8/pRXbcHboGj8TgVMiVMZox2ckqKZ1VmMap7jEgKAp5tp7GrjUt2ORjcMmKI3f1bodcIMgD+xlu9LWODkCylcBH+AP0FsPvg9ir2MMiy7mjDszhnthr5yTZ7CR3TZAlJWo/r+qYhR4aRVEKYoYkVw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788772952; c=relaxed/simple;
	bh=9pP2LBH2tRB2fSrm0jAQcOrNlQWLGQS+CkLe4y+uwzE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fafs4x7SMgBf8GoSMQG7HheMBcha/n3hmH8wpDRrDVjKzH8NI7pA0R627uCzhiGix204EVwEHJ5yeJKpSUC3QvFdbnTTjpOy1HLOPolJyAeKakPB3sLrT0nHUAFwS1Uqy0NWZJbH95+v+5l/UWRr/fh7ip/UOtwYXphAhl7Vyl0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=S6p5BYqe; arc=pass smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="S6p5BYqe"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cc891373e0so34890275ad.2
        for <chrome-platform@lists.linux.dev>; Mon, 07 Sep 2026 02:22:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788772947; cv=none;
        d=google.com; s=arc-20260327;
        b=IEGGauTAqkfvUfZsF5hoLFzC9h/Euw8vWeg3H/IDAV9WY8rmQHLBOLs/SOuyKB1kiJ
         IxHJFpb9gSEGFxwk/Z+GyffAjUwGhyuLCox3N1e03sdaEt4kkyIOEAgwd9v+hHm+2+Sz
         3yb4PZ+gKx6cLMvmLFY8VhWujV3Gj/qgUbgDRF9B0tcOMSddAmx5BNP5wTPRVknwO0Sr
         zFHZZlq6PzJMleBX0m+4GdGqRRkH50fEUOYeZb4BPMXxYiqaZVjYig/Soo/EwTqpVxAD
         bTJpMJZPYWa8pR31O3Qpzr9QCUbzUgUVjTUUSrdr0YhLy6toQTbnNgieJS5VeZWw3GoN
         5AUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dIdpvoo6ET3LdAMRgZeWItpBO23tAVsjAcGJm+O6jZE=;
        fh=J4Dlbpxx+UUJPASQvE/xdYKHA7YgJuBQydXpxDadlmo=;
        b=MzdAl/rEdR47mFgqvFfvFOi30+k1C5lLi/FmIGaASQhsyfEAOE7sq7WwjZJyWlN9cF
         GYdWs9EElODK7fryOpnqkWfYEA9rRZF7p0LkD924/wWuIlV6mLizGCLudR0SJ96eZlUU
         W9P43r1ZJbpE2q/Lvhi+HydsC3voHpTmNnZ2LcrO/U0QiujBRXOXmj8Yjhzzbyy1IjZi
         rD6OT1Gb9bvanRLdeZcSgufWtxlMyXd8hu1PdVDMDo0TeKAU7HT7BgDyHjJBEWOuyTRI
         lhWmcgYkGy04E/Kg1jw0YMjWgWRXEqibhDjw8nYzuv3UQtvi6TH9WqJPriM7w0xcrXfI
         EKGw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788772947; x=1789377747; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dIdpvoo6ET3LdAMRgZeWItpBO23tAVsjAcGJm+O6jZE=;
        b=S6p5BYqeLhag4Z9y4TNOMcuELaVeAoA5F8Fkx3o8xSi55ry1FMC5thvKmFhtEBWViB
         yzRR9Hfye6KGCZZlnZkHB0rF6mlUN92Q/i5MUSsXTIYrZO5IP+ZOzZGp77lEtn/9l5R8
         d8kES9FGDL/BgqFRqZ7NWkPL++MFyTvRRq6Io=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788772947; x=1789377747;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dIdpvoo6ET3LdAMRgZeWItpBO23tAVsjAcGJm+O6jZE=;
        b=qmcDNoS5iFPS9wIMCgeIKAlH2sP/oAghaBaDzZAk6N8kqzPqSCZoCCo73kuKmnWPdi
         RtSg7bpsS/iZlDOmuk29J0At5bG4/g1FwrmosQf8Fp6fFuFuMI32KqYJTP2IUT0ZOvqm
         yovEg1y17k1QCEJyu4LTs41mXpEJuuZl2n8Jg9g+xjDG+MyHqrTyqbXlzCqUVmLmNL/E
         uLt5Kz5dprdhhugHy7RA0anWZqEcp7dbu8dhARpi9bPZl0KiJn45boacYZ+etfgXQLne
         GrDLK1Vjy+7gGnVgkCCohpjXEBRxNBoyq/Pe3oDmdozmFzuMFgizeBZcAtANuAB7rjTX
         eGfA==
X-Forwarded-Encrypted: i=1; AKwUvBzl5pSr+hVijVjl0t+od9rirzsWcBWGH0XeZevh4BdVvSoRE3MGNnhHwkrbFNZCRJC5lwW+yQ4nWvQKnI1x1H0=@lists.linux.dev
X-Gm-Message-State: AFuF++n+Z5SvWc28CJz7LfTb86GlzCf1kPw99ptWk6IiCtV0lC9YenAv
	BLfo9XJCG7brMW4e4xCL0FBmra+HbuTrfRIrEeK0logVEQD3dOyOlex6RLbYCyvDM3KTRchvFpX
	I/AjRXdQG76RNZBLc6Mh5/XlfZb7qyu8JpVaCb/pj
X-Gm-Gg: AYBFou2Vy4eOI8LTDLDELSz8XrR0oZyRDWNXSXvsZ86LsFSr5XYBNVxx/6zIJCFsHmS
	L/B+J1iKcDbFT/Mfm1r8JmduDjkK8cl0AWugcsFTpaSArZwi3XxuZxTn2eNuQ3Ab+iar2pLLgDc
	rlUMJcfS47LaOLs82AzOX8/McZswecJA1O9yRYIpjPFnISCohOYGoScUba2EAZzahzOSeJqALM4
	gYWPBznkyF7DuhT6ENbLtYkDz6WGd0GzK71W1tZelNayKXpBKuMHRtjo7mAqfH4t/9ceJYni1Mg
	SD298Pb/PZiCLhqbRz6sEqFspWLuUaIVwihOiwO2ajr/pNBtY7MUyjV51zs9m1z/hPerjBad4MI
	=
X-Received: by 2002:a17:90b:3809:b0:396:4dfb:5890 with SMTP id
 98e67ed59e1d1-39b260d333amr33194124a91.2.1788772947395; Mon, 07 Sep 2026
 02:22:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260129131928.794768-1-akuchynski@chromium.org> <MW4PR00MB15018588F16E0D52D1DF923BBFB52@MW4PR00MB1501.namprd00.prod.outlook.com>
In-Reply-To: <MW4PR00MB15018588F16E0D52D1DF923BBFB52@MW4PR00MB1501.namprd00.prod.outlook.com>
From: Andrei Kuchynski <akuchynski@chromium.org>
Date: Mon, 7 Sep 2026 11:22:16 +0200
X-Gm-Features: AcwNN1XUAas48pVFC6R6vrCHxAVxzljD-4_1LSrSn5q2OojYadYh0KoAXibEGQg
Message-ID: <CAMMMRMf=5SoF_UdkraUEZ=GdzpCxHONUw9wxJOAPCcWTG5QXLw@mail.gmail.com>
Subject: Re: [PATCH 1/2] platform/chrome: cros_ec_typec: Enforce
 priority-based mode selection
To: Shijia Zhang <codgician@outlook.com>
Cc: Jameson Thies <jthies@google.com>, Benson Leung <bleung@chromium.org>, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 4, 2026 at 1:50=E2=80=AFPM Shijia Zhang <codgician@outlook.com>=
 wrote:
>
> Hi Andrei,
> I tested both posted patches on a Redrix Chromebook with an HP
> Thunderbolt 4 Ultra 180W/280W G6 dock attached throughout boot. My
> latest test uses NixOS linux_testing built from upstream Linux v7.2.3.
> The Chrome EC reports AP-driven mode entry as enabled:
>
>   /sys/class/chromeos/cros_ec/ap_mode_entry: yes
>
> I am testing this as a user with affected hardware and have limited
> familiarity with the kernel's Type-C internals. The observations below
> concern patch 1/2; I did not notice a separate problem with patch 2/2.
>
> 1. USB4 capability was not exposed
>
> With the posted series alone, cros_ec_typec did not list USB4 in
> /sys/class/typec/port1/usb_capability, so the new USB4 entry path was
> not reached. The connector has a usb3-port reference. That referenced
> USB3 port contains usb4-host-interface and usb4-port-number, while the
> connector has no usb4-port reference.
>
> I checked upstream coreboot to understand the firmware topology. At
> commit 42f142bd9fad2c9f47c4925845bac6fa686f68c7, the Chrome EC ACPI
> generator looks for a USB port object with port type 4 when populating
> the connector-level usb4-port reference:
>
>   <https://github.com/coreboot/coreboot/blob/42f142bd9fad2c9f47c4925845ba=
c6fa686f68c7/src/ec/google/chromeec/ec_acpi.c#L46-L90>
>
> The generic connector writer can emit that reference when supplied:
>
>   <https://github.com/coreboot/coreboot/blob/42f142bd9fad2c9f47c4925845ba=
c6fa686f68c7/src/acpi/acpigen_usb.c#L93-L102>
>
> However, I could not find a USB port type 4 object in that tree. The
> Intel platform files instead put usb4-host-interface and
> usb4-port-number on the xHCI SuperSpeed port. Alder Lake does so here:
>
>   <https://github.com/coreboot/coreboot/blob/42f142bd9fad2c9f47c4925845ba=
c6fa686f68c7/src/soc/intel/alderlake/acpi/tcss_xhci.asl#L120-L186>
>
> I found the same pattern in the Tiger Lake, Meteor Lake, Panther Lake,
> and Nova Lake platform files. Linux already consumes this mapping in
> usb4_usb3_port_match():
>
>   <https://github.com/torvalds/linux/blob/v7.2/drivers/thunderbolt/usb4_p=
ort.c#L95-L127>
>   <https://learn.microsoft.com/en-us/windows-hardware/design/component-gu=
idelines/usb4-acpi-requirements>
>
> To test whether this missing capability was the blocker, I made a
> local diagnostic change that kept the connector-level usb4-port check
> and also recognized the mapping on the referenced USB3 port. The
> Type-C class then reported:
>
>   /sys/class/typec/port1/usb_capability: usb2 usb3 [usb4]
>
> 2. USB4 entry did not replace the existing mode
>
> After the diagnostic capability change allowed the posted USB4 path to
> run, I observed a second problem. In one cold boot the EC mux initially
> reported:
>
>   Port 1: USB=3D1 DP=3D1 TBT=3D0 USB4=3D0
>
> The cros_typec_enter_usb_mode(..., USB_MODE_USB4) call returned no
> error, but the EC remained in the existing mode and no downstream USB4
> router appeared. I also observed a boot where the EC reported USB4
> while the AP-side mux state was not yet coherent, so treating that
> reported USB4 state as a completed transition was not sufficient.
>
> To test whether the existing mode was the blocker, I locally requested
> USB_MODE_USB3 to exit modes, waited for a later EC port update to report
> DP/TBT/USB4 clear, and then requested USB_MODE_USB4. I advanced those
> steps from the existing serialized port worker and used a bounded
> timeout only to detect a missing transition.
>
> For this test I also registered the PD notifier before queuing the
> initial port update, so a mode-change event generated during that update
> could be observed.
>
> With the dock continuously attached, a later cold boot reached:
>
>   EC mux:                                  USB4=3D1, DP=3D0, TBT=3D0
>   /sys/class/typec/port1-partner/usb_mode: usb2 usb3 [usb4]
>   IOM port status:                         0x86000368
>
> The HP router appeared at 16.885 seconds, its retimer at 17.147
> seconds, and boltd authorized a 40 Gb/s link in both directions. The
> complete USB hub and 2.5 GbE topology also enumerated, and no
> cros_ec_typec transition timeout occurred.
>
> Could you advise whether these observations match the intended behavior?

Hi Shijia,

Thanks for running tests on the patch!

>
>   1. Is cros_ec_typec expected to obtain USB4 capability from the
>      standard mapping on the referenced USB3 port, or is firmware
>      expected to provide a connector-level usb4-port reference?

I am unable to assist with this directly. A potential workaround would be
altering the cros_typec_parse_port_props function:

    //if (fwnode_property_present(fwnode, "usb4-port"))
        cap->usb_capability |=3D USB_CAPABILITY_USB4;

>   2. Does the USB4 entry path expect DP/TBT/USB4 to be inactive before
>      requesting USB_MODE_USB4? If so, which layer is expected to exit
>      the existing mode and wait for completion?
>

No, it doesn=E2=80=99t. The typecd daemon probably enables DP altmode.
To test mode_selection, stop the service first:

# stop typecd

Thanks,
Andrei
