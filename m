Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1277533C2
	for <chrome-platform@lists.linux.dev>; Thu, 12 May 2022 14:53:49 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id g6so10799795ejw.1
        for <chrome-platform@lists.linux.dev>; Thu, 12 May 2022 07:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+XvPMge8GrQx5gO2KcAEj9ecLQjDwShTO+vRI9VUWdM=;
        b=AdeM+wd9VggiptdGj4RlKrq1Zoo5M7tYT3f+1hw3KBsuT0NlLz8HDkN9enALA6YUgM
         4LmTl7YdtM6Gqknm6oJrxF86dlzGfvj0zhXoaViAfDDi91bMpxqQGpppi1RtNV3+Bavl
         FrusBYZ2HYsLB4m2+WwRZe9HSPiWzO98UPRWijcCsYdvoM35T4aUbxfuk0l6jG51jn/q
         J4504prHIlTda4/dbJzTvSV7M3SWPD5hrrWC5XbJ4MsJpphdrQG5C9LAlgURXMBUpgXp
         HiY0kU18wRukU3+bOcjOXDVRb+F6bjRztYM6uHospU4WWRHfhqk+yJzHSThFRJ0QJcYN
         Rb/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+XvPMge8GrQx5gO2KcAEj9ecLQjDwShTO+vRI9VUWdM=;
        b=BBpHD3ikHB/TVc04gOOSb+yWIo2icbym4RgnNVB//mPPx1pIOqEsTGHtUd62BQYiPQ
         ByJVpFdEw+9nwj+dPZhMT56PZQl863dWoENmLn7/tQFIRJE8Shw2L9vwPyJ+CAMyqbQJ
         HLEvu6hdU1lb6rzqa4TcXDHaq2e+M5XqTtOBPdOGaW+wEXOWNfKgzNFtRAa/hntKgPqL
         D+XDg/QwJc8CMwzXvKIQZd4xm9MBnYmSTwcaaQCxQ/JIzfyncOZiM7WE1GGk2LNzTdFs
         tv26XGbgeL82wi4RxodoN/OH5pT3/KNkEzbqUBoPkJ2xVGi43vcguNxE2+MpOcbkEdPb
         m7AA==
X-Gm-Message-State: AOAM531ugW57wVn+jlQjf8wVgLMlcNawnN8PZGTBGs5wwtNGmlsFZBP6
	i5KeiYCyk4vUrziuqb0ajaRR0KG3E5SeMZLVJlSv+EcINxCi2g==
X-Google-Smtp-Source: ABdhPJz4KM01Q6WW2YJQ2mtQoa4n66n6UyZA8le0momIGBOrHbnlH9NMzSRAZfxRiY9E+0mGNck+N9MIeDV3c9P/z0U=
X-Received: by 2002:a17:907:1b1f:b0:6f0:21ec:6051 with SMTP id
 mp31-20020a1709071b1f00b006f021ec6051mr235589ejc.533.1652367228047; Thu, 12
 May 2022 07:53:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220512083627.885338-1-tzungbi@kernel.org> <20220512083627.885338-2-tzungbi@kernel.org>
In-Reply-To: <20220512083627.885338-2-tzungbi@kernel.org>
From: Guenter Roeck <groeck@google.com>
Date: Thu, 12 May 2022 07:53:36 -0700
Message-ID: <CABXOdTeBRz=TYdrXEERHek+QXtYi5f9+jCDnuZYdc5VDmGtwoA@mail.gmail.com>
Subject: Re: [PATCH 1/6] platform/chrome: cros_ec_proto: drop unneeded
 BUG_ON() in prepare_packet()
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	chrome-platform@lists.linux.dev, linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, May 12, 2022 at 1:36 AM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
>
> prepare_packet() gets called if `ec_dev->proto_version` > 2.  For now, it
> must be equivalent to EC_HOST_REQUEST_VERSION.
>
> Drop the BUG_ON().
>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

An alternative would be to return -EPROTO, but given the context this
is just a waste of code space.

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---
>  drivers/platform/chrome/cros_ec_proto.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
> index ac1419881ff3..db1c8ba43171 100644
> --- a/drivers/platform/chrome/cros_ec_proto.c
> +++ b/drivers/platform/chrome/cros_ec_proto.c
> @@ -60,7 +60,6 @@ static int prepare_packet(struct cros_ec_device *ec_dev,
>         int i;
>         u8 csum = 0;
>
> -       BUG_ON(ec_dev->proto_version != EC_HOST_REQUEST_VERSION);
>         BUG_ON(msg->outsize + sizeof(*request) > ec_dev->dout_size);
>
>         out = ec_dev->dout;
> --
> 2.36.0.512.ge40c2bad7a-goog
>
