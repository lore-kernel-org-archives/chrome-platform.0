Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4CA78F6C
	for <chrome-platform@lists.linux.dev>; Tue, 11 Apr 2023 17:38:28 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id d10so3341987qka.3
        for <chrome-platform@lists.linux.dev>; Tue, 11 Apr 2023 10:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1681234708; x=1683826708;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ltwEbPLpEBbFjDIAQmHrcCoiOGTHzLY2RRt8dbXMc0=;
        b=amw84m3Tez31Bg1eMOJVRH2qFaRcXxEw7AxUXd3hrqB1s2ZFRWCR9SSDPe0s0NDTWL
         WxpRNaJjY373c/MJQ9J9k1B/GuCfdy2i0CEZFKZ+ltLJk7CN2/hmCWjE+UCMyXDokqYj
         5EAjNOX+HGmfqWxbMpQZidDsFnPXE8M1yMaBA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681234708; x=1683826708;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2ltwEbPLpEBbFjDIAQmHrcCoiOGTHzLY2RRt8dbXMc0=;
        b=YfgIBjjGZihJ0qLaDxjOwHjkOidokU8b7UzSTJSpZ4CZVrmJpxU+23rXDgOPzefLIR
         1HzBDSQIQIEilB5W4nAoneKQIKeYXbMi7bIpOAglizU7SyBsEu1P45od9V4Wtcnt7Tfw
         e+0VEfcyzOGDzWCyt/h5yI4Mh7AD256oBGWVXCl4OxSDVEJzYChLz3HzxaRf1Qxec7Y+
         lAe1VvB+x+Ai1y/ranEZOlSBfU94aNWnakZVlnEVLZGGnxxizjUXRQkqb67lGl4N3Zzr
         Xzqj2UDhz/jIQn9TWDjL2u4gDmmP9vJQpJAzOWWIUo5ZiOupCavBOg8y8XjT+ZP7hjWh
         U9Gg==
X-Gm-Message-State: AAQBX9ekM6JuzmMN3Y+9+SzrTjzAUOAhWyD0I99S73koyEc6moj4Hr3C
	Y16Kh8HJLYu+pZOKoW/hhXoCob3H3VNgiKdvkH9tVg==
X-Google-Smtp-Source: AKy350bMDrWAKrSe0SAcyvmqdoyexuIUq+W7gYDpFNT70F+14hRM69r5OFNyhkmWMCS8UYPxSl5fVQKeFLBEC0+8eHY=
X-Received: by 2002:a05:620a:2a04:b0:74a:bafc:84ed with SMTP id
 o4-20020a05620a2a0400b0074abafc84edmr318022qkp.5.1681234707764; Tue, 11 Apr
 2023 10:38:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230411053308.1572493-1-tzungbi@kernel.org>
In-Reply-To: <20230411053308.1572493-1-tzungbi@kernel.org>
From: Prashant Malani <pmalani@chromium.org>
Date: Tue, 11 Apr 2023 10:38:15 -0700
Message-ID: <CACeCKaduOqLwGsGLEVzdG2hDNq8=07a_V-uGLZWT0f3+Wb603Q@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: cros_ec_debugfs: fix kernel-doc warning
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, chrome-platform@lists.linux.dev, 
	robbarnes@google.com, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 10, 2023 at 10:33=E2=80=AFPM Tzung-Bi Shih <tzungbi@kernel.org>=
 wrote:
>
> Fix the following kernel-doc warning:
>
> $ ./scripts/kernel-doc -none drivers/platform/chrome/*
> [...]
> warning: This comment starts with '/**', but isn't a kernel-doc comment.
>
> Fixes: 14bb09b32f43 ("platform/chrome: cros_ec: Separate logic for gettin=
g panic info")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> ---
> I should put it in my checklist in the future before pushing patches to
> for-next.

Can this be added to kernelci?

>
>  drivers/platform/chrome/cros_ec_debugfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/platform/chrome/cros_ec_debugfs.c b/drivers/platform=
/chrome/cros_ec_debugfs.c
> index 414ebfffcf83..c876120e0ebc 100644
> --- a/drivers/platform/chrome/cros_ec_debugfs.c
> +++ b/drivers/platform/chrome/cros_ec_debugfs.c
> @@ -400,7 +400,7 @@ static void cros_ec_cleanup_console_log(struct cros_e=
c_debugfs *debug_info)
>         }
>  }
>
> -/**
> +/*
>   * Returns the size of the panicinfo data fetched from the EC
>   */
>  static int cros_ec_get_panicinfo(struct cros_ec_device *ec_dev, uint8_t =
*data,
> --
> 2.40.0.577.gac1e443424-goog
>
>
