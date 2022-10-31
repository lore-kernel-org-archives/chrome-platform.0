Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4B233DF
	for <chrome-platform@lists.linux.dev>; Mon, 31 Oct 2022 17:40:40 +0000 (UTC)
Received: by mail-qv1-f41.google.com with SMTP id x15so8798751qvp.1
        for <chrome-platform@lists.linux.dev>; Mon, 31 Oct 2022 10:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zifHrvYvMlTWsTnps4ihNmDiDeOWXS2VJSsB6k3XPm8=;
        b=gHDZkYk2Jt4cNpqVCajdyzVh/bCvE2SHKu/LjnjrPS/kRwld6H8KSgWaXMx7pESyai
         yuGiTx2q1ksOAUZR+elyJYbegvbKkNnpLOv9PvXjjc74N+mZUPJ9lryJMO6xaqcIfvYb
         /opdDc0X58SrCRXRz93L2DiGMY6CNnkTKwJWo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zifHrvYvMlTWsTnps4ihNmDiDeOWXS2VJSsB6k3XPm8=;
        b=Zj5ATV8LJmilZWmQgJIRs9aSO7MOSM8SF9Rxlw2caOhMy5kQ+JBnKVh+GBdLtglnFQ
         V3jZFtY/J0RnLXp6/LSFnzN/bjGlcFsCLjpj95Hu7ennnFsksvEPbwCMazoYE0NQlNvb
         xZ3folAli7cfFVDEnkFswP0WkdXxWfFDLoV3QZG3nx+2RDCP0zpe1481bArbzQPeoa+p
         dGuFPVKyzZuIhhvsrAbMHypda7RWm9/Mc85UaCEwUOYYBjQkNR2FhWCco6+HuwYnPG50
         e6Y7gQToWCfRNMY9hOn6pXc3SslgITxlDTpYfFh5n+B/A4aB4i/MzzpEXl11Kdb2hb1r
         rWGg==
X-Gm-Message-State: ACrzQf2fEYpR35wN9GdKc+8hxvHU/icOEHpAoQTe7K3GC3ffmj5nRdzo
	psFHRql8ovR7mqNernGyIG09zyLrQ8N9Rw==
X-Google-Smtp-Source: AMsMyM5Qd/lHHODaq9Wrd7HdkVmhchDPXzTF9mUYMg2AxNXmtFbzuZjkKCeNK69AbsG9KKO31KXwfw==
X-Received: by 2002:a05:6214:20aa:b0:4bb:7e1a:9df0 with SMTP id 10-20020a05621420aa00b004bb7e1a9df0mr12013553qvd.34.1667238039420;
        Mon, 31 Oct 2022 10:40:39 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com. [209.85.219.173])
        by smtp.gmail.com with ESMTPSA id y12-20020a05620a25cc00b006eea461177csm5098175qko.29.2022.10.31.10.40.38
        for <chrome-platform@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Oct 2022 10:40:38 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id 187so14562896ybe.1
        for <chrome-platform@lists.linux.dev>; Mon, 31 Oct 2022 10:40:38 -0700 (PDT)
X-Received: by 2002:a05:6902:1186:b0:6c1:653a:ba74 with SMTP id
 m6-20020a056902118600b006c1653aba74mr13434851ybu.546.1667238037637; Mon, 31
 Oct 2022 10:40:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <635f6274.170a0220.79b7b.5d1a@mx.google.com>
In-Reply-To: <635f6274.170a0220.79b7b.5d1a@mx.google.com>
From: Brian Norris <briannorris@chromium.org>
Date: Mon, 31 Oct 2022 10:40:25 -0700
X-Gmail-Original-Message-ID: <CA+ASDXPHbdh=_s4qiZbCQz0_VbFuh_gKvsq=mWFZ5QY-QUPKAA@mail.gmail.com>
Message-ID: <CA+ASDXPHbdh=_s4qiZbCQz0_VbFuh_gKvsq=mWFZ5QY-QUPKAA@mail.gmail.com>
Subject: Re: chrome-platform/for-kernelci baseline: 98 runs, 5 regressions (v6.1-rc1-5-g27b86a65cd16)
To: "kernelci.org bot" <bot@kernelci.org>
Cc: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io, 
	chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org, 
	groeck@chromium.org, pmalani@chromium.org
Content-Type: text/plain; charset="UTF-8"

On Sun, Oct 30, 2022 at 10:51 PM kernelci.org bot <bot@kernelci.org> wrote:
>
> chrome-platform/for-kernelci baseline: 98 runs, 5 regressions (v6.1-rc1-5-g27b86a65cd16)

Does anybody look at these? It's a bit weird to see "5 regressions",
and then to look back on the last few weeks (probably months) and see
the same errors...

> Regressions Summary
> -------------------
>
> platform                     | arch  | lab           | compiler | defconfig                  | regressions
> -----------------------------+-------+---------------+----------+----------------------------+------------
> mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chromebook | 1
> rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chromebook | 4
>
>   Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernelci/kernel/v6.1-rc1-5-g27b86a65cd16/plan/baseline/
>
>   Test:     baseline
>   Tree:     chrome-platform
>   Branch:   for-kernelci
>   Describe: v6.1-rc1-5-g27b86a65cd16
>   URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git
>   SHA:      27b86a65cd16b0e94ef69196b008d701a53feddb
>
>
> Test Regressions
> ----------------
...
>
> platform                     | arch  | lab           | compiler | defconfig                  | regressions
> -----------------------------+-------+---------------+----------+----------------------------+------------
> rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chromebook | 4
>
>   Details:     https://kernelci.org/test/plan/id/635f585b4cac8cb70ce7db4e
>
>   Results:     85 PASS, 7 FAIL, 0 SKIP
>   Full config: defconfig+arm64-chromebook
>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>   Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v6.1-rc1-5-g27b86a65cd16/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-rk3399-gru-kevin.txt
>   HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v6.1-rc1-5-g27b86a65cd16/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-rk3399-gru-kevin.html
>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20221024.1/arm64/rootfs.cpio.gz

Where can I find the test cases? (i.e., what's determining a "failure"
for one of these?)

As a small guess, I see that we're missing some common configs, like:

CONFIG_PHY_ROCKCHIP_DP

This sometimes means that the display subsystem (and therefore audio
subsystem that relies on DP for one of its components) is not going to
fully set itself up properly. Usually things can still sort of work,
but I don't really know what the tests are looking for.

Brian
