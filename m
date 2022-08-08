Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3BC57A
	for <chrome-platform@lists.linux.dev>; Mon,  8 Aug 2022 20:54:31 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id g5so15464737ybg.11
        for <chrome-platform@lists.linux.dev>; Mon, 08 Aug 2022 13:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=aTpTyem7hydQrdauCJI2WQMASMRymFSEwd0UcF/UCsE=;
        b=XMP9oSMoQ90wtPcC/91xLp5SbJZA38a60hNa0NEz2TRR/auLCJsAO7NTaIfU8N1hN1
         4hdX8eAxd+EJQbsm554CuEr3RU4y0QFOTWo+6HByymPBGVRWgfLzkC12nsDfo+MwbCFp
         7UR8TdExmh6VrTcXylcMI/6zheq0oWhVfm8P0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=aTpTyem7hydQrdauCJI2WQMASMRymFSEwd0UcF/UCsE=;
        b=4v7PTZ59HKiEYuy8GtG1MtgsrkFWsyj1pKMiuyG7UOQO4v7cRGRs8abXbjwqzKK909
         swwTtmsz0G7R5gS4DdcrQfbDmVP37iJ8hsYaJf2VZSV1I3RhRFysj546dIjVwILvX+rM
         QRvL06gyMByfBZjnYoB73kU+X9OHk4iUKd/IptQHAZb5Q/Pu99SPBY6bDQouVXzq623I
         iwOdts2nF8QaqC901Bh1kcUxHyqUOgc0GcIQfNnj78fPW2EKSr6OW8aw9nq+A9/HKCh2
         QrewOeKWlC4NHTTlq5l9xIMsv1iC/S3WFT8lmtjergpaLMrCr6NK9LbIDCBUcEAUST3G
         4k5A==
X-Gm-Message-State: ACgBeo3LUAhyzh1w53/ZGfsVJ0Ys78ONhi84R914vcWmoPvZa1ViBfpy
	XYYypXEv4WMDDax/1wVUOLbteI42YJbMUlhE3iUsnHIBVvU7CA==
X-Google-Smtp-Source: AA6agR47bYiQ/YcerY6PgRCIknae0Vr9RwG714iEU/HdDhjsTL85y/os3T9qGlLDZdANpmzmh9gl56FBuqOx7pf/bDI=
X-Received: by 2002:a25:7450:0:b0:67b:e79c:a1be with SMTP id
 p77-20020a257450000000b0067be79ca1bemr6570428ybc.196.1659992070709; Mon, 08
 Aug 2022 13:54:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220805151551.1.Idd188ff3f9caddebc17ac357a13005f93333c21f@changeid>
In-Reply-To: <20220805151551.1.Idd188ff3f9caddebc17ac357a13005f93333c21f@changeid>
From: Prashant Malani <pmalani@chromium.org>
Date: Mon, 8 Aug 2022 13:54:19 -0700
Message-ID: <CACeCKafDg3VE0C8ZELvoET==RtmSpOHxC5R4Fnxmyyt+XSF3tA@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: cros_ec: Expose suspend_timeout in debugfs
To: Evan Green <evgreen@chromium.org>
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>, Rajat Jain <rajatja@chromium.org>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Stephen Boyd <swboyd@chromium.org>, Tinghan Shen <tinghan.shen@mediatek.com>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Evan,

On Fri, Aug 5, 2022 at 3:17 PM Evan Green <evgreen@chromium.org> wrote:
>
> diff --git a/drivers/platform/chrome/cros_ec_debugfs.c b/drivers/platform/chrome/cros_ec_debugfs.c
> index 0dbceee87a4b1a..530378bd4359dd 100644
> --- a/drivers/platform/chrome/cros_ec_debugfs.c
> +++ b/drivers/platform/chrome/cros_ec_debugfs.c
> @@ -470,6 +470,9 @@ static int cros_ec_debugfs_probe(struct platform_device *pd)
>         debugfs_create_x32("last_resume_result", 0444, debug_info->dir,
>                            &ec->ec_dev->last_resume_result);
>
> +       debugfs_create_u16("suspend_timeout", 0664, debug_info->dir,
> +                          &ec->ec_dev->suspend_timeout);

Can we call this "suspend_timeout_ms" instead? That makes it clear what the
units being used are.

BR,

- Prashant
