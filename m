Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07808D30A
	for <chrome-platform@lists.linux.dev>; Mon, 24 Jul 2023 14:24:39 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4036bd4fff1so594651cf.0
        for <chrome-platform@lists.linux.dev>; Mon, 24 Jul 2023 07:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690208678; x=1690813478;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pkIhpdJWJTuZezzP/l2vzDD5JfIvO74YBI+VYglFL3Q=;
        b=DWerY0S6IeCOHio16FbGhYemH/W999KFLpH8phK1soNLiJml27Xmy8Fb+nZLAKCnV3
         GajUmIfCOFipoT6iKWd98EUge1QSkpa3XSAZMdSKz9ATafrUZFRm3oNc3DACBRoXCD1+
         GtD0870FQN0jQTaPphs6jOnS9iRYMR5HioAioWCbMsMF+RI5KRDwEcCDQFD5q6hJETmf
         UexQEzqppfpSmvi+5Hg8Iu6pvaUYW5K+DRd17UEaM4XxuLFa0/AbGA6T9f9DscKqciec
         2WyVPyb0dSUuUS1KP/shy/EbqbvjPg64bYKotp/7OrqDwjjFWLXXEoyVyy7JI67QUs63
         u7Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690208678; x=1690813478;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pkIhpdJWJTuZezzP/l2vzDD5JfIvO74YBI+VYglFL3Q=;
        b=SO3CU7E74QnHfkiGDJ1CzjgdpXg9MkQL4oYkSiDIR6rXfilM0Zdz1DMVp8J2gDR1v8
         ItWAF48M+PkrwZsNZ3Fm/XLrfxAXJtc6xB+IqckgCtihOj36SKs/s9XyKt6ng8n0Ni5t
         Agb5Od3dClpcd30og/xtid16tVMTkIxJ+MaG74iReUY7z1YyjQvv/Rf5/uWscgxtuCPB
         mbYN5b0umToS74a81WHxcZ55tNujVBYm3Z+H097XQAjOHulSQP0OPZs2EabOSYJkL35N
         nNVtzwslOlKZCzoT+uxjgNaxazFPn9i01yuP0ajXif0XxDeGjEaq8w8mVOFFIiwEsBnS
         F2/A==
X-Gm-Message-State: ABy/qLY6TVeJpt2w0nGSMLoOYoD8Q7B8qQvefoZha0YKhAcqYs/rYBQ1
	93SVdaLy66E+C3pU3VFJsQ9cN/0QFScfATyfJkdSYA==
X-Google-Smtp-Source: APBJJlHzHmYCZBUs/NreP7uSxSB9K4FHLP7EtcrqgPxymHOPQPvjax6K6I9h8YFgppnkOB0OclZUACmJoQU3Z0fQgNg=
X-Received: by 2002:ac8:4e50:0:b0:403:eeb9:a76 with SMTP id
 e16-20020ac84e50000000b00403eeb90a76mr465240qtw.17.1690208678556; Mon, 24 Jul
 2023 07:24:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230724081247.678784-1-tzungbi@kernel.org>
In-Reply-To: <20230724081247.678784-1-tzungbi@kernel.org>
From: Guenter Roeck <groeck@google.com>
Date: Mon, 24 Jul 2023 07:24:24 -0700
Message-ID: <CABXOdTdyEBjwuqSpq_KPYVezsUCHkQkh+BttUFBasqptzdg6QQ@mail.gmail.com>
Subject: Re: [PATCH v2] MAINTAINERS: Add drivers/firmware/google/ entry
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, gregkh@linuxfoundation.org, 
	chrome-platform@lists.linux.dev, jwerner@chromium.org, swboyd@chromium.org, 
	briannorris@chromium.org, dianders@chromium.org, sjg@chromium.org, 
	dossym@chromium.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 24, 2023 at 1:13=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.org> =
wrote:
>
> From: Brian Norris <briannorris@chromium.org>
>
> These are mostly used for Chrome platforms, so group it in with the same
> mailing list, repo, and (one) committer.
>
> Signed-off-by: Brian Norris <briannorris@chromium.org>
> Acked-by: Julius Werner <jwerner@chromium.org>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Acked-by: Guenter Roeck <groeck@chromium.org>

> ---
> This is a revival for v1[1] as it is few-months-old.
>
> Planning to let chrome-platform-firmware use:
> - "for-firmware-kernelci" branch for KernelCI[2].
> - "for-firmware-next" branch for both 0-day[3] and linux-next.  Patches c=
an
>   rebase onto the branch if they are aiming to chrome-platform-firmware.
>
> Haven't figured out how to make it in linux-next specific files though
> (e.g. [4]).
>
> [1]: https://patchwork.kernel.org/project/chrome-platform/patch/202210211=
72624.1.I119456791d197eb7d159f09e7479d8759008a954@changeid/
> [2]: https://github.com/kernelci/kernelci-core/pull/2028
> [3]: https://github.com/intel/lkp-tests/pull/312
> [4]: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/=
commit/?id=3D4d2c646ac07cf4a35ef1c4a935a1a4fd6c6b1a36
>
> Changes from v1:
> - Update Tzung-Bi's email address.
>
>  MAINTAINERS | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3be1bdfe8ecc..8293a4ab82d8 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8758,6 +8758,15 @@ S:       Supported
>  F:     Documentation/networking/device_drivers/ethernet/google/gve.rst
>  F:     drivers/net/ethernet/google
>
> +GOOGLE FIRMWARE DRIVERS
> +M:     Tzung-Bi Shih <tzungbi@kernel.org>
> +R:     Brian Norris <briannorris@chromium.org>
> +R:     Julius Werner <jwerner@chromium.org>
> +L:     chrome-platform@lists.linux.dev
> +S:     Maintained
> +T:     git git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
> +F:     drivers/firmware/google/
> +
>  GPD POCKET FAN DRIVER
>  M:     Hans de Goede <hdegoede@redhat.com>
>  L:     platform-driver-x86@vger.kernel.org
> --
> 2.41.0.487.g6d72f3e995-goog
>
