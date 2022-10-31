Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCDEA7C
	for <chrome-platform@lists.linux.dev>; Mon, 31 Oct 2022 19:21:38 +0000 (UTC)
Received: by mail-vk1-f171.google.com with SMTP id g4so2360757vkk.6
        for <chrome-platform@lists.linux.dev>; Mon, 31 Oct 2022 12:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jujtXd1IPqW1o/TppooQUikptRqZyYKvejTXQy0WL1w=;
        b=qzby7SiSn5Tzp2U6TIo+71b87EM4WlPINbUw6hlHMrJHwBZxSvWSd28MLyF1gvQVJT
         upu4++iBcyM2p1FjXB/VF5HD4hpNeHIpfxGIJQGr4HiOMvSNl5Hda7VEh6RC7rX/Njt/
         dG19FbjsUWV68ACUkjPHdZ6S75H8wtDGym0e9NjagZ7t+qbIIzjw3fTCrwqb5WDmUf1u
         WyZ/18NI0llAcAPXcQ/n0PwMtIj+9qXYRFmya6Qzgov7AT+e+Uo5kXHib6WKL+KydGoG
         MvO8D/JJQO+DWIEo8AENPeWObSLQu7htBJI1WDfRjkWY4aN632OUC//PcEDU+zpt3qNv
         DcEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jujtXd1IPqW1o/TppooQUikptRqZyYKvejTXQy0WL1w=;
        b=g8LX3TplZUnsV/2ck9o5MLOhAm/+cCWRHyi7wLxlMeV9LGL/5VViKBDqeXCQ05Vekv
         jGoPhMK0VY1B4M8QueBGDlmOEtQOtokHwkksUVrtweAgZeaVLB68VOOBC7gPiYkJP9Uh
         P6iAu+/a7akRkXVEc+0mY4kM1M+uSDR5EHIFhpLVGyz/po1KmR76ZselRIgNg1FbGscy
         rvldr+IHZwWzBVjn7tABnYRSbaS08esrlN5xltFWYg2cdrBihmpxRFj7I/uPgobASzUJ
         Ffqa2NXw6kmRHt9ky2/JpsC7RRLL+HtK20a75UOYyDVU7RdjEGR09pceH7VpVC6NuBDN
         rKjQ==
X-Gm-Message-State: ACrzQf3j/RFaEPmXVx8HTCu6R54vlOepEYPVd++41a+VGR7bQN38j6hs
	AEFVow2XM79JvichJm6djVj9nRixj2+lJ67g55PQuQ==
X-Google-Smtp-Source: AMsMyM4m5+q7kAZ93JnyDUJpfrWVvqheLMFh8OzBz/8Akbpxd0m63jLd4oULMTrwvoGDhy+s/ycE/lf1gGq2sUJK4Dg=
X-Received: by 2002:a1f:9fd3:0:b0:3ab:c8e4:f15e with SMTP id
 i202-20020a1f9fd3000000b003abc8e4f15emr5723775vke.1.1667244097497; Mon, 31
 Oct 2022 12:21:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <635f6274.170a0220.79b7b.5d1a@mx.google.com> <CA+ASDXPHbdh=_s4qiZbCQz0_VbFuh_gKvsq=mWFZ5QY-QUPKAA@mail.gmail.com>
In-Reply-To: <CA+ASDXPHbdh=_s4qiZbCQz0_VbFuh_gKvsq=mWFZ5QY-QUPKAA@mail.gmail.com>
From: Guenter Roeck <groeck@google.com>
Date: Mon, 31 Oct 2022 12:21:26 -0700
Message-ID: <CABXOdTd0wmiXmW97RUUHE6CdDieOwzTxGs1q7FPDusBq9SUrfA@mail.gmail.com>
Subject: Re: chrome-platform/for-kernelci baseline: 98 runs, 5 regressions (v6.1-rc1-5-g27b86a65cd16)
To: Brian Norris <briannorris@chromium.org>, Tzung-Bi Shih <tzungbi@google.com>
Cc: "kernelci.org bot" <bot@kernelci.org>, kernel-build-reports@lists.linaro.org, 
	kernelci-results@groups.io, chrome-platform@lists.linux.dev, 
	eballetbo@gmail.com, bleung@chromium.org, groeck@chromium.org, 
	pmalani@chromium.org
Content-Type: text/plain; charset="UTF-8"

+Tzung-Bi Shih

On Mon, Oct 31, 2022 at 10:40 AM Brian Norris <briannorris@chromium.org> wrote:
>
> On Sun, Oct 30, 2022 at 10:51 PM kernelci.org bot <bot@kernelci.org> wrote:
> >
> > chrome-platform/for-kernelci baseline: 98 runs, 5 regressions (v6.1-rc1-5-g27b86a65cd16)
>
> Does anybody look at these? It's a bit weird to see "5 regressions",
> and then to look back on the last few weeks (probably months) and see
> the same errors...
>
> > Regressions Summary
> > -------------------
> >
> > platform                     | arch  | lab           | compiler | defconfig                  | regressions
> > -----------------------------+-------+---------------+----------+----------------------------+------------
> > mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chromebook | 1
> > rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chromebook | 4
> >
> >   Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernelci/kernel/v6.1-rc1-5-g27b86a65cd16/plan/baseline/
> >
> >   Test:     baseline
> >   Tree:     chrome-platform
> >   Branch:   for-kernelci
> >   Describe: v6.1-rc1-5-g27b86a65cd16
> >   URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git
> >   SHA:      27b86a65cd16b0e94ef69196b008d701a53feddb
> >
> >
> > Test Regressions
> > ----------------
> ...
> >
> > platform                     | arch  | lab           | compiler | defconfig                  | regressions
> > -----------------------------+-------+---------------+----------+----------------------------+------------
> > rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chromebook | 4
> >
> >   Details:     https://kernelci.org/test/plan/id/635f585b4cac8cb70ce7db4e
> >
> >   Results:     85 PASS, 7 FAIL, 0 SKIP
> >   Full config: defconfig+arm64-chromebook
> >   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
> >   Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v6.1-rc1-5-g27b86a65cd16/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-rk3399-gru-kevin.txt
> >   HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v6.1-rc1-5-g27b86a65cd16/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-rk3399-gru-kevin.html
> >   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20221024.1/arm64/rootfs.cpio.gz
>
> Where can I find the test cases? (i.e., what's determining a "failure"
> for one of these?)
>
> As a small guess, I see that we're missing some common configs, like:
>
> CONFIG_PHY_ROCKCHIP_DP
>
> This sometimes means that the display subsystem (and therefore audio
> subsystem that relies on DP for one of its components) is not going to
> fully set itself up properly. Usually things can still sort of work,
> but I don't really know what the tests are looking for.
>
> Brian
