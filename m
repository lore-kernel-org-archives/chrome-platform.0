Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E255182C8
	for <chrome-platform@lists.linux.dev>; Thu,  3 Aug 2023 16:26:51 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-40c72caec5cso362671cf.0
        for <chrome-platform@lists.linux.dev>; Thu, 03 Aug 2023 09:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691080011; x=1691684811;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n1ON+Mo9D9JTIGQ9m3U5cAsdcHBiwuo7X6gN6hamoF4=;
        b=K1SngZE+zEzBIiSL3QjaQ3bD4Kh35pOQTe6QaLB1mHOBpA5Z9goiDlu1vULBXWBRqI
         Hjj7UDjQa7CY5HVjw3seSsgFGqrzVUXZOnP/qrUokoTm7VURTTpHVx87Z/rmycvPiGju
         ZSS7CpGge5oigDg3B9lndni/1t0agHii7I298pHBSAscIBdIYNtSL+5ORLplAdUqdTrw
         SPjLDd8w5P821kFHhY8ixjQx9rZvxd8IuiD5xbsUG6Sv2A3PAL4LzpPJNELbFSYzSko8
         O7DQhWBo6mzszBYWzOpQQjKvs8hcyt9F6Dlhma4dKNocnWpcixZRkI3QjDlkqt6Kc0aK
         lW0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691080011; x=1691684811;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n1ON+Mo9D9JTIGQ9m3U5cAsdcHBiwuo7X6gN6hamoF4=;
        b=WdvuRcEWFk3YaZzQ8vfRpbpYWx8re3lAO87WijrtkRP3tocz9c6A8GM2Pt/PIptmN5
         ppCrJY2JabMu9q3rOXjPXcmWs+yRHMGafmt3qGncZRTsPFAsfRSe2qEWew630Q9W4r4g
         CjAa36h2ADEdfIC1BqnmbR0tRQ/oD8shPvDnBhH1EcwgQQw3nMUF5n/IBreszpkz085f
         MyJUcXce9SEChlBNL9ghJwusygjJPpkBi+4ft6BL/XKSdlkRM+LQkMn8f5saHbaEqyua
         2BhJVHy0n/lpv/N9TkKSz60hG/qhVH9kVzeH6WvKb8D1sMmQaAfnbr4NuUZU09nNgQ2V
         PuXw==
X-Gm-Message-State: ABy/qLamWo6iOgYO65ErEkT7Nv8UelojRpwQ7/odlrTyG1SLOjyyVWue
	8nLJPUE2Kt6DsTDO1m4mtbhT+6cBevSIn4gL4ogsEDuiAz2mCBoZzts=
X-Google-Smtp-Source: APBJJlGXqcQnLn7RFHXH0PMK7Xw7glbu9mbjofbQSplihHp7bLsIDpM536jh3FdKrlmnflG+QwDO09fK96nm8idUBZ0=
X-Received: by 2002:a05:622a:182:b0:3f5:2006:50f1 with SMTP id
 s2-20020a05622a018200b003f5200650f1mr1389546qtw.12.1691080010734; Thu, 03 Aug
 2023 09:26:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230803100846.3223564-1-tzungbi@kernel.org>
In-Reply-To: <20230803100846.3223564-1-tzungbi@kernel.org>
From: Guenter Roeck <groeck@google.com>
Date: Thu, 3 Aug 2023 09:26:37 -0700
Message-ID: <CABXOdTeWkpZpE1MmijEwdEPLyQLXn3JzRZesMt3onmRKHwaqjA@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: update maintainers of chrome-platform
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 3, 2023 at 3:09=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.org> w=
rote:
>
> Add Tzung-Bi as a maintainer of chrome-platform.
>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3be1bdfe8ecc..76299dc9a04c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4812,6 +4812,7 @@ F:        drivers/input/touchscreen/chipone_icn8505=
.c
>
>  CHROME HARDWARE PLATFORM SUPPORT
>  M:     Benson Leung <bleung@chromium.org>
> +M:     Tzung-Bi Shih <tzungbi@kernel.org>
>  L:     chrome-platform@lists.linux.dev
>  S:     Maintained
>  T:     git git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
> --
> 2.41.0.585.gd2178a4bd4-goog
>
