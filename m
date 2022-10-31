Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C1F1A601
	for <chrome-platform@lists.linux.dev>; Mon, 31 Oct 2022 23:36:36 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id i3so11991895pfc.11
        for <chrome-platform@lists.linux.dev>; Mon, 31 Oct 2022 16:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fIEWd8onM/z3T5jqOPsrRMbqWzCIn60YiPnXRTLOInc=;
        b=GxQ9FkKhuDVlZW7+n/r/0AYDrUKRj9fT4DfaXz5OkH6F32hNbBDGLUUbea7EQPDAfV
         YqPqU8JVsZ/cnhWXEdYuc8k7Hwc+g9FTbY1s4abp9gByogjoLzb+av481Wogo4Dfhrd5
         WD/k7lGhBb1tU5CY1TgyLJppPtmqQ8AKLl79Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fIEWd8onM/z3T5jqOPsrRMbqWzCIn60YiPnXRTLOInc=;
        b=mwSHA50/33RLIiiLBMD7A0txxR0jeurZY5PViLVg5A/+2hxknzUNzMI+PpPBoJYyPJ
         JBGtdGaKZGC6vsT8UhnAuZJahUGC++4web+WRGMsePoh465Ak6uLOeOMTFv2zKdojrEv
         yonbSJrZbilgmVdycEhOEH1FFAN5rh1bvjPiWG/9mXvr1Ti7elfU9r0QERxsMNKg+CKi
         vlPBcugH2zVhhJkMNShfbwwA1W7SDgXmZLyvDqIb8V1MIIWB9YS/ly23AicFUVCboEGD
         HcCBo9Ep3voOhdHhplRehyNGLooB4+8/IGsmiTOYJ03H5drRI2ofET5runOyjt1dK1PW
         asDQ==
X-Gm-Message-State: ACrzQf1yheYkX3/xV7ECyLNHcKYi0lAkZmLbIUR2npTBKkWExGrYgNUJ
	mRBPzjHR/BCLjDUoD2vWYXdddQ==
X-Google-Smtp-Source: AMsMyM7YaNSKyryTKiHMmUKNSWFHD8vfAx1yO3sljy9/ITSw3Gzhl3RBm/F9sb6KMnpe8gGrj+N92A==
X-Received: by 2002:a63:ec51:0:b0:46f:ed8d:7089 with SMTP id r17-20020a63ec51000000b0046fed8d7089mr417346pgj.469.1667259395610;
        Mon, 31 Oct 2022 16:36:35 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:cf9d:6561:637d:2194])
        by smtp.gmail.com with ESMTPSA id d9-20020a170902f14900b00185480a85f1sm4903074plb.285.2022.10.31.16.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 16:36:35 -0700 (PDT)
Date: Mon, 31 Oct 2022 16:36:32 -0700
From: Brian Norris <briannorris@chromium.org>
To: Mark Brown <broonie@kernel.org>
Cc: kernelci-results@groups.io, "kernelci.org bot" <bot@kernelci.org>,
	kernel-build-reports@lists.linaro.org,
	chrome-platform@lists.linux.dev, eballetbo@gmail.com,
	bleung@chromium.org, groeck@chromium.org, pmalani@chromium.org,
	tzungbi@google.com
Subject: Re: chrome-platform/for-kernelci baseline: 98 runs, 5 regressions
 (v6.1-rc1-5-g27b86a65cd16)
Message-ID: <Y2BcAFf77/JMQxYR@google.com>
References: <635f6274.170a0220.79b7b.5d1a@mx.google.com>
 <CA+ASDXPHbdh=_s4qiZbCQz0_VbFuh_gKvsq=mWFZ5QY-QUPKAA@mail.gmail.com>
 <Y2BAGBVik+VvLTwF@sirena.org.uk>
 <Y2BKg6gefPQ9BUAc@google.com>
 <Y2BRxJ/qrl9cjWbK@sirena.org.uk>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y2BRxJ/qrl9cjWbK@sirena.org.uk>

On Mon, Oct 31, 2022 at 10:52:52PM +0000, Mark Brown wrote:
> On Mon, Oct 31, 2022 at 03:21:55PM -0700, Brian Norris wrote:
> > I can't find a single mention of "i2s1" or "probed" in the kernelci
> > repo, so I must be missing something. Is there some external config
> > file in another repo? Or else the test configs are autogenerating cases
> > on the fly based on parsing...the device tree?
> 
> The KernelCI repo just says what testsuites to invoke and how, it's not
> got the actual testsuites.  Those X didn't probe failures come from
> bootrr:
> 
>    https://github.com/andersson/bootrr
> 
> forked to:
> 
>    https://github.com/kernelci/bootrr
> 
> (which could use some upstreaming...) with the specific errors for

Neither of those looks particularly active. If I patch stuff, is it
better to send PRs to the 'andersson' one or the 'kernelci' one?

> gru-kevin coming from:
> 
>    https://github.com/kernelci/bootrr/blob/main/boards/google%2Ckevin
> 
> which ends up in our rootfss.

Ah, thanks. That helps. Although it hurts in other ways, see below.

> Those failures in particular come from some reorganisation of the DT for
> the Rockchip devices a while back which regularly gets bisected by our
> bisect bot, I did report it or something very similar as looking like a
> false positive but nobody followed up.  I see there's some version
> dependent checks for the acclerators which may not be working properly
> any more I guess but nothing for the I2S.
> 
> > Anyway, I don't know how or why that ever passed, because AFAICT, RK3399
> > Chromebooks should only have a single I2S block enabled, and they're
> > passing the 'rockchip-i2s0-probed' case. So it feels like I need to be
> > disabling some test case.
> 
> Yes, that was what I'd determined too - the reorganisation of the DT
> looked legit, I can't remember what it was exactly.  I suspect it may
> have boiled down to adding some missing default disables, or removing an
> erroious enable for the board.

Ah, based off your pointers, I see the test was looking for what used to
be the i2s2 alias. But then I recall we stopped using that i2s instance:

https://git.kernel.org/linus/b5fbaf7d779f5f02b7f75b080e7707222573be2a
arm64: dts: rockchip: Switch RK3399-Gru DP to SPDIF output

I forgot that folks did that downstream long ago but never bothered
finishing upstreaming that until I got to it this year...
...but still, it's kinda sad that we've bothered to set up all this "CI"
and then nobody paid any attention :( I only noticed because I recently
subscribed to chrome-platform@lists.linux.dev.

Anyway, I guess I gotta go patch the test expectations.

> > Somewhat similar story for cros-ec-sensors-accel{0,1}-probed, although I
> > believe the sensor driver is still working for me; I also see no
> > cros-ec-sensors errors in the KernelCI logs. So I wonder what exactly
> > the test is looking for (e.g., maybe the device name changed?).
> 
> IIRC there were some of these that were a device name change.

Oh, this one makes me gag.

"assert_device_present cros-ec-sensors-accel0-probed cros-ec-sensors cros-ec-accel.11.*"

? Really, ".11"? That sounds like we're trying to test kernel
implementation details, asynchronous probe race conditions, Makefile /
linker ordering, and similar -- not anything that we actually expect to
remain stable across kernel versions :(

I'm not sure there's a great stable way to refer to such devices, so
maybe it'd be better to write this as "count the number of devices"
instead? Or I think this particular driver supports an "id" sysfs
attribute, which refers to a stable underlying firmware ID. But that'd
involve even more device-specific logic.

I don't think I even care *why* the ID changed; that ID is far from a
stable thing, if I'm reading it correctly. At least most of the others
refer to hardware addresses, which are a little more reasonable to rely
on (even if the device naming still isn't a stable guarantee).

Brian
