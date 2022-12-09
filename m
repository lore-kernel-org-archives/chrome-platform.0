Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF46A3F
	for <chrome-platform@lists.linux.dev>; Fri,  9 Dec 2022 09:40:06 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id u12so4595092wrr.11
        for <chrome-platform@lists.linux.dev>; Fri, 09 Dec 2022 01:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dn77Bpmg8Lgy/TwDaT+sF7u4xcKwyLcr7OZQFEwm6tQ=;
        b=Y70shUpo5QdbJpyJtIIpHjemgSq6ewl8m1A9ouBRUHbWx5f+AWXOZidczXv/ifhWtm
         rmO2AHh0Cu1mi8eHo7HolhvNv/wVzhTA53xTBoyaJMbkIHgOyb8SPjMQUVZFhstEZ7HY
         uCw9DY69sZamWed6eEsZJffNnRtt98uCFgPQ1cCnedX0U+Acb61zcAi3u9HdMdGWdO+F
         hthjUCphiWfx2x6ji4FN/mUqG9HUKP7PyUUJuU5u2FBU5cLaK/kRWlmhC0CPwvrdL8xV
         ed2/8ljPTLC81uxuVlGxTGOZSoDLHKdEkpOI4V/UEKQ94IAub9tXKU0ghSHtJfD3NWlG
         FZAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dn77Bpmg8Lgy/TwDaT+sF7u4xcKwyLcr7OZQFEwm6tQ=;
        b=WdBXOk399WoVoZYx+9MlOUjUp7VCaI60fj9n6dKMUp9/dhDtGvV75bObEQR4Mm5dUU
         R9X/qNwEME7NbicW0APZt+6HBckZAbZw7Sj4Szb/bOPN9CNEZJxlQ0A3zXbGpvF1LCog
         TndsIKFtQa/U+rZJavVkswoKoKsPV9QKK4bibBcVmAy/Gegh5iIb+gk5hls3RHVU69jB
         U7vA1eWwRvqvW5terirBDfQhfNTWDh3PxShygPZnJCDGVcnmnofe074DjDS8q4qKA2Zs
         aiBGes6RwKt3co9y47r+ySKyThEBvGDlCfpwKix6e720WcEZuuoMruxleh6P6YKDuZ03
         wang==
X-Gm-Message-State: ANoB5pmd45PhKF08uPbB7/K6EAhrxzEo74SrqqyBfJAFcZtJozq8tOZY
	eQ6SWyOQyeNtYWYUwdcmZYRy0guZQ5ip+uxUr6ZCbA==
X-Google-Smtp-Source: AA0mqf4JfBua+5bvVqaoHDW8BIn01HJQBxbLxhCd7x03Nznnt4bVnvqGwz2Zb+JQI2ers0wr7llQNF4DfrE4f5XVeNY=
X-Received: by 2002:a05:6000:1d8b:b0:242:750a:5b56 with SMTP id
 bk11-20020a0560001d8b00b00242750a5b56mr6927251wrb.271.1670578804351; Fri, 09
 Dec 2022 01:40:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <63916948.170a0220.3dbdf.426e@mx.google.com> <233c8754-f848-3c92-de8e-5a6b4818143a@collabora.com>
In-Reply-To: <233c8754-f848-3c92-de8e-5a6b4818143a@collabora.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Fri, 9 Dec 2022 17:39:53 +0800
Message-ID: <CA+Px+wXBkrwLM6eoEHTVNsaGH63_qE2zcyAa0CPxyDMi_KUz0Q@mail.gmail.com>
Subject: Re: chrome-platform/for-kernelci cros-ec: 8 runs, 8 regressions (tag-chrome-platform-for-v6.2-2-g5990db2d66b3)
To: =?UTF-8?Q?Ricardo_Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
Cc: kernelci-results@groups.io, bot@kernelci.org, 
	kernel-build-reports@lists.linaro.org, chrome-platform@lists.linux.dev, 
	eballetbo@gmail.com, bleung@chromium.org, groeck@chromium.org, 
	pmalani@chromium.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 8, 2022 at 5:25 PM Ricardo Ca=C3=B1uelo
<ricardo.canuelo@collabora.com> wrote:
>
>
>
> On 8/12/22 5:34, KernelCI bot wrote:
> > chrome-platform/for-kernelci cros-ec: 8 runs, 8 regressions (tag-chrome=
-platform-for-v6.2-2-g5990db2d66b3)
> >
> > Regressions Summary
> > -------------------
> >
> > platform                     | arch   | lab           | compiler | defc=
onfig                    | regressions
> > -----------------------------+--------+---------------+----------+-----=
-------------------------+------------
> > asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_=
64_defcon...6-chromebook | 1
> > hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_=
64_defcon...6-chromebook | 2
> > hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_=
64_defcon...6-chromebook | 2
> > rk3399-gru-kevin             | arm64  | lab-collabora | gcc-10   | defc=
onfig+arm64-chromebook   | 2
>
> Reported in https://github.com/kernelci/kernelci-project/issues/145
>
> > sc7180-trogdo...zor-limozeen | arm64  | lab-collabora | gcc-10   | defc=
onfig+arm64-chromebook   | 1
>
> Reported in https://github.com/kernelci/kernelci-project/issues/147

Thanks for filing the issues.  I'll try to investigate them to see
what we could get.  Let's work on the reported issues then.
