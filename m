Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B717D530
	for <chrome-platform@lists.linux.dev>; Mon, 24 Jul 2023 16:12:30 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-521e046f6c7so14978a12.1
        for <chrome-platform@lists.linux.dev>; Mon, 24 Jul 2023 09:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1690215149; x=1690819949;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UuSQtZTet+eAyqfbBEfkhu5SJqh+xw4A6N964EsQ4Sw=;
        b=ie+/oBFiD9k59516TDdM/u1B1hvZbGR8P2/fCJLnhe0L/y3gVwo3Y2mFlhIDEuB02X
         M18POaudkZtF9tlJkUYYNLDYRmojjz4RM0lWQhGa3sERaOhI5g6bBRz2KML6eXrdtNRy
         z0nVZfUPffYVLzwRpWsN4HzXX/7dNjCnBWS+E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690215149; x=1690819949;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UuSQtZTet+eAyqfbBEfkhu5SJqh+xw4A6N964EsQ4Sw=;
        b=U1pfOowtYwhIrnCHJLznpGiTku80Z4NbpMVfqPXt2WiH7SNGqzbtcw1n1D9ldAMaQd
         G6cx2cQ26QN2hFwbkZ9rmnmFWWt/xMI2IBv6StH1it2ZtUxSMuaDa0rB3co5tNSnc2km
         9twTAOMne7FvDVXB6E/grGFsw9cwaUakW22iIzcXtjUyl7819qCOIOFvX/BTKZfhDnSO
         7gsFdvQsaDVp6cACBpeo4g6n+tKj0zKUPF4FDP4Cc1xBJNR7OnzR8bKqkmc/iDhRYyRv
         VA/tq7gyXT7yzn7aF5QQxMQKkwZo6jq8Ym20MgMd9tG3DOZpT7AqK7c//4KrqsqV38J4
         cmxw==
X-Gm-Message-State: ABy/qLYTAW+SFjXD2e7M2PjUVBnhtBzmWG/wwnyCU2yxt2sW5zFMoc/1
	PKrhWxwUh8vC0uw7j0h+GPgLPCfFTF7g9XqULhAm2Q==
X-Google-Smtp-Source: APBJJlHzalG15C5dnv5jNkeJtiPSi4cXg13qdDqWPHZn+PcsLW0vh+r6HHMSv5D+IKM1OfKDgdVhycAsrYoAJSZPEqQ=
X-Received: by 2002:a50:d5ce:0:b0:51e:16c5:2004 with SMTP id
 g14-20020a50d5ce000000b0051e16c52004mr149254edj.6.1690215148721; Mon, 24 Jul
 2023 09:12:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230724081247.678784-1-tzungbi@kernel.org>
In-Reply-To: <20230724081247.678784-1-tzungbi@kernel.org>
From: Benson Leung <bleung@chromium.org>
Date: Mon, 24 Jul 2023 09:12:16 -0700
Message-ID: <CANLzEks2Ld8nBkczhsEpchfULrZF8rojdG3qvujZLzbU-L+Aiw@mail.gmail.com>
Subject: Re: [PATCH v2] MAINTAINERS: Add drivers/firmware/google/ entry
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: groeck@chromium.org, gregkh@linuxfoundation.org, 
	chrome-platform@lists.linux.dev, jwerner@chromium.org, swboyd@chromium.org, 
	briannorris@chromium.org, dianders@chromium.org, sjg@chromium.org, 
	dossym@chromium.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tzung-Bi,

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

Acked-By: Benson Leung <bleung@chromium.org>

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
>


--=20
Benson Leung
Staff Software Engineer
Chrome OS Kernel
Google Inc.
bleung@google.com
Chromium OS Project
bleung@chromium.org
