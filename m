Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3CB6443D
	for <chrome-platform@lists.linux.dev>; Mon, 31 Oct 2022 22:21:58 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id f140so11914561pfa.1
        for <chrome-platform@lists.linux.dev>; Mon, 31 Oct 2022 15:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uP+5AwDT7kNW1wI4c+CXjsqbrZpHnHxypFRWcsC5nCs=;
        b=BmwkDZ6x4Ex3KSLNq7tiqWKFJhAAOM6PgfFphPqMxH5RA08U55ql85fM5GjpWbwKLn
         lJyqXoTNPTIFrIFmG3B0k8v4q4oXXykmbWyTIqbJrD8yzqKl+lgqC1szWMdpMrP87Uup
         hTRzRUmRiRRbpVgMM4Nc21nL2HpPAVJgEQki0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uP+5AwDT7kNW1wI4c+CXjsqbrZpHnHxypFRWcsC5nCs=;
        b=e3an8rTd5U+lamgS2ZQF/k5zxdeHP9ALvf/zUx25jZOlYvku5OPapf9dbkaHsZtFel
         ZMHCujo8Xj/5xLiTqgdph8/9oNdSIw3JMGHiZBFdhxab/S1hyqeLF45AfQKh0uouRm8T
         DCxK/uylyMPUXP++yFu3y2XL4UyckKJfg2wG3lgfLR2ExQ4CcI3Vu74CHs+buUzDr49R
         +2UNUivaonq8uIn3DM9/N8LXUyCwbWrwHBiKXxclPic6/cxA1Razzb2CTZTh3xq0Kebp
         qMp6IM4VnH3qwXejmC7E57wDr6cZ5DzsnjoLmSpE1ijiOW5l97+535NnX8kc8GDKAlN8
         mzag==
X-Gm-Message-State: ACrzQf1ZgWu29Su4ggbfJF1OYaDACOuQpcpJpxmPMcuKsagAEr/NPbNQ
	FrYdLrOKaBORrdpLUrhDoa1fMg==
X-Google-Smtp-Source: AMsMyM51Y769FlPe9UzSXWWTlfI5JKrIs0Um3XV4dUwKSe6l3ImUr8aoC1dSNG6aFZDR4S+dUBPxaw==
X-Received: by 2002:a63:4283:0:b0:457:dced:8ba3 with SMTP id p125-20020a634283000000b00457dced8ba3mr14594934pga.220.1667254918484;
        Mon, 31 Oct 2022 15:21:58 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:cf9d:6561:637d:2194])
        by smtp.gmail.com with ESMTPSA id nh16-20020a17090b365000b0020a825fc912sm4683660pjb.45.2022.10.31.15.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 15:21:57 -0700 (PDT)
Date: Mon, 31 Oct 2022 15:21:55 -0700
From: Brian Norris <briannorris@chromium.org>
To: Mark Brown <broonie@kernel.org>
Cc: kernelci-results@groups.io, "kernelci.org bot" <bot@kernelci.org>,
	kernel-build-reports@lists.linaro.org,
	chrome-platform@lists.linux.dev, eballetbo@gmail.com,
	bleung@chromium.org, groeck@chromium.org, pmalani@chromium.org,
	tzungbi@google.com
Subject: Re: chrome-platform/for-kernelci baseline: 98 runs, 5 regressions
 (v6.1-rc1-5-g27b86a65cd16)
Message-ID: <Y2BKg6gefPQ9BUAc@google.com>
References: <635f6274.170a0220.79b7b.5d1a@mx.google.com>
 <CA+ASDXPHbdh=_s4qiZbCQz0_VbFuh_gKvsq=mWFZ5QY-QUPKAA@mail.gmail.com>
 <Y2BAGBVik+VvLTwF@sirena.org.uk>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y2BAGBVik+VvLTwF@sirena.org.uk>

On Mon, Oct 31, 2022 at 09:37:28PM +0000, Mark Brown wrote:
> On Mon, Oct 31, 2022 at 10:40:25AM -0700, Brian Norris wrote:
> > On Sun, Oct 30, 2022 at 10:51 PM kernelci.org bot <bot@kernelci.org> wrote:
> > >
> > > chrome-platform/for-kernelci baseline: 98 runs, 5 regressions (v6.1-rc1-5-g27b86a65cd16)
> 
> > Does anybody look at these? It's a bit weird to see "5 regressions",
> > and then to look back on the last few weeks (probably months) and see
> > the same errors...
> 
> Nobody seems to care about a lot of the Chromebook stuff AFAICT.

:(

Well, if I/we are ever going to change that, it'd be nice to get a
little further on the below questions still:

> > >   Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernelci/kernel/v6.1-rc1-5-g27b86a65cd16/plan/baseline/
> 
> > Where can I find the test cases? (i.e., what's determining a "failure"
> > for one of these?)
> 
> The first place to go is the details link above, though it's a bit less
> clear for the non-baseline tests you should at least be able to see
> what's going on on the console which will often help with finding the
> testsuite, or the error messages printed are descriptive as to what
> they were looking for specifically.  The kernelci-core repo contains all
> the stuff to map from a test name inot running something (often with
> external assistance) but there's lots of templating in the way.

Thanks. I already looked at most/all of those links. And I was first
going for the "baseline" tests, since those seem pretty basic, and if we
can't pass those, we're probably totally lost.

> > As a small guess, I see that we're missing some common configs, like:
> 
> > CONFIG_PHY_ROCKCHIP_DP
> 
> > This sometimes means that the display subsystem (and therefore audio
> > subsystem that relies on DP for one of its components) is not going to
> > fully set itself up properly. Usually things can still sort of work,
> > but I don't really know what the tests are looking for.
> 
> The baseline tests are just making sure that the system comes up to a
> shell.  The driver loaded tests are checking that particular devices
> have a driver bound to them.

For one specific example: I'm looking at rockchip-i2s1-probed, which
fails here:

https://storage.kernelci.org/chrome-platform/for-kernelci/v6.1-rc1-5-g27b86a65cd16/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-rk3399-gru-kevin.html

I can't find a single mention of "i2s1" or "probed" in the kernelci
repo, so I must be missing something. Is there some external config
file in another repo? Or else the test configs are autogenerating cases
on the fly based on parsing...the device tree?

Anyway, I don't know how or why that ever passed, because AFAICT, RK3399
Chromebooks should only have a single I2S block enabled, and they're
passing the 'rockchip-i2s0-probed' case. So it feels like I need to be
disabling some test case.

Somewhat similar story for cros-ec-sensors-accel{0,1}-probed, although I
believe the sensor driver is still working for me; I also see no
cros-ec-sensors errors in the KernelCI logs. So I wonder what exactly
the test is looking for (e.g., maybe the device name changed?).

Brian
