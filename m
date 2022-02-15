Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 537D71B87
	for <chrome-platform@lists.linux.dev>; Tue, 15 Feb 2022 23:30:27 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id 124so775645ybn.11
        for <chrome-platform@lists.linux.dev>; Tue, 15 Feb 2022 15:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EzHCJ85sRrlahQIyrQcbvfA6P+M37pNHrlrF2bva2nk=;
        b=hAXfkB+gvnygZ7ZWzrx7cu7fvBjolhNKBBNBqTMv4Ehm8bbvbVBmPGubfq+y/e+WtF
         HOMvSIOyCBoPVqORduFx9VfRTTKk0n5Z2yqNrBW1JV6I6V4TNk4xdGEtBUxzX2gv/0Fr
         zv2jYrZlT5WT7cl5lxQ4YElLC9on3a/scdbbM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EzHCJ85sRrlahQIyrQcbvfA6P+M37pNHrlrF2bva2nk=;
        b=RZnLtMP9fuSgvt25rmbFibNe5vlqjRj8zJKdukhKMCU9i4d/kWF8F265rWmoLQevPg
         Kly8v2Xf3S5QIZgQXmwTeb6Nu+sHp78xl6j/MeVUgoLRYX2JunCjk6qSQzh53mQXHqkm
         8LUvbjJUupGrtF+ipzH4bTz+9WpZyKE0xX1UeFe2vpmCCc5MlMvPuo1Bxmiy7CQT3Qzo
         MxPwjWqisze1tr+Ujd7WfdXcX/dr5kyMr26TeLBtfbMP38fdAWJXAus7rfPW6UlGj5/d
         /hPRyeeRToBNGa/r3NmuwCqYyCTsRm5uEd0iy3+4eGBIl2MY+8T6dyJHngd9NnnvdZxS
         HZVA==
X-Gm-Message-State: AOAM532UzoBKX8vCXdJnAuDh8VDLWXlmK58ht6Lf7m1lvb54sZGsxDHs
	nzP/BqrfE9JggTfXgqzcpnOohgR11rQP0ejpCWFcrg==
X-Google-Smtp-Source: ABdhPJxaJn7O0gfOGt86qqZvZlADfDAIJpLSWHbRAHDBvh6DLR1H5qpPcB5qfFWhTvKuSXsnj3OE75SbDABWs8uIXwg=
X-Received: by 2002:a0d:c885:0:b0:2d0:df6a:fe95 with SMTP id
 k127-20020a0dc885000000b002d0df6afe95mr71313ywd.325.1644967826186; Tue, 15
 Feb 2022 15:30:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <620c300a.1c69fb81.8d64d.b89c@mx.google.com>
In-Reply-To: <620c300a.1c69fb81.8d64d.b89c@mx.google.com>
From: Prashant Malani <pmalani@chromium.org>
Date: Tue, 15 Feb 2022 15:30:14 -0800
Message-ID: <CACeCKafyDBmEg_GLas9Xj3X3WM1Qd3DGhsBCNXDj5L_inDTARw@mail.gmail.com>
Subject: Re: chrome-platform/for-kernelci sleep: 7 runs, 1 regressions (v5.17-rc1-8-g981d3de32cfb)
To: "kernelci.org bot" <bot@kernelci.org>
Cc: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io, 
	chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org, 
	groeck@chromium.org
Content-Type: text/plain; charset="UTF-8"

I don't believe grunt has the ACPI device (or rather, it shouldn't),
so I don't think this regression is related to the mux patches just
merged [1]

[1] https://lore.kernel.org/chrome-platform/164495521075.19688.3105207399888394248.git-patchwork-notify@kernel.org/T/#t

I will wait for another day in case kernel CI folks have any
objections, before moving this to for-next...

Thanks!

On Tue, Feb 15, 2022 at 2:58 PM kernelci.org bot <bot@kernelci.org> wrote:
>
> chrome-platform/for-kernelci sleep: 7 runs, 1 regressions (v5.17-rc1-8-g981d3de32cfb)
>
> Regressions Summary
> -------------------
>
> platform           | arch   | lab           | compiler | defconfig                    | regressions
> -------------------+--------+---------------+----------+------------------------------+------------
> hp-11A-G6-EE-grunt | x86_64 | lab-collabora | gcc-10   | x86_64_defcon...6-chromebook | 1
>
>   Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernelci/kernel/v5.17-rc1-8-g981d3de32cfb/plan/sleep/
>
>   Test:     sleep
>   Tree:     chrome-platform
>   Branch:   for-kernelci
>   Describe: v5.17-rc1-8-g981d3de32cfb
>   URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git
>   SHA:      981d3de32cfb74afd48d44805b8f5943a1723aa0
>
>
> Test Regressions
> ----------------
>
>
> platform           | arch   | lab           | compiler | defconfig                    | regressions
> -------------------+--------+---------------+----------+------------------------------+------------
> hp-11A-G6-EE-grunt | x86_64 | lab-collabora | gcc-10   | x86_64_defcon...6-chromebook | 1
>
>   Details:     https://kernelci.org/test/plan/id/620c20e6a59bf7860ac62985
>
>   Results:     22 PASS, 1 FAIL, 0 SKIP
>   Full config: x86_64_defconfig+x86-chromebook
>   Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
>   Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v5.17-rc1-8-g981d3de32cfb/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/sleep-hp-11A-G6-EE-grunt.txt
>   HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v5.17-rc1-8-g981d3de32cfb/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/sleep-hp-11A-G6-EE-grunt.html
>   Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20220204.0/amd64/rootfs.cpio.gz
>
>
>   * sleep.rtcwake-freeze-2: https://kernelci.org/test/case/id/620c20e6a59bf7860ac6298f
>         new failure (last pass: v5.17-rc1-4-g5c223bb92642)
>
>     2022-02-15T21:52:26.548061  <6>[   34.072441] r8152 2-4:1.0 eth0: carrier on
>     2022-02-15T21:52:26.551777  rtcwake: assuming RTC uses UTC ...
>     2022-02-15T21:52:26.554735  rtcwake: wakeup from \"freeze\" using rtc0 at Tue Feb 15 21:52:32 2022
>     2022-02-15T21:52:26.561516  <6>[   34.080269] PM: suspend entry (deep)
>     2022-02-15T21:52:26.564602  <6>[   34.094053] Filesystems sync: 0.000 seconds
>     2022-02-15T21:52:26.574302  <6>[   34.098694] Freezing user space processes ... (elapsed 0.001 seconds) done.
>     2022-02-15T21:52:26.577533  <6>[   34.107429] OOM killer disabled.
>     2022-02-15T21:52:27.554041  <6>[   34.110918] Freezing remaining freezable tasks ... (elapsed 1.013 seconds) done.
>     2022-02-15T21:52:27.560836  <6>[   35.087741] printk: Suspending console(s) (use no_console_suspend to debug)
>     2022-02-15T21:52:27.662521
>     ... (1143 line(s) more)
>
