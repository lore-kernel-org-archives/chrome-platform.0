Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D397B
	for <chrome-platform@lists.linux.dev>; Mon, 26 Dec 2022 06:48:54 +0000 (UTC)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-14fb3809eaeso6007336fac.1
        for <chrome-platform@lists.linux.dev>; Sun, 25 Dec 2022 22:48:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0mHD/2+Jjgd4kOgQdqrbw9FzJcac/KJqtYWIpEg8WyE=;
        b=RoZT8yPJGtA293oMEUL7mXh6tb566Ry/D7vnD9nYWVKTuHC1bBJEIv/QxC9XnPxXGZ
         fXYHfdXDK5OgYqEDE0iimjej6ZJdj+jDFvTeICu7OgBgQc64Ou495hzyMjmZrAjvU0K/
         FWQn3wAynQlynEOT2UeOeJWl2woBB7QQGu5D52gHfZC/qSRh3ijpHCAAH142lJ6G/HP6
         y4xmk2bIk1xIHQlSSua4tUvvUUWFAc2jIVoUwmq1xGxXI+N8b0jvbVGfeF7G8+lj4vR4
         fxP+3+5NvwGh3bfdiqMc3nMIZL/wI27dN6dFyKV+gXy3f4xppBjyyDMooPMuf8vQ0GqQ
         mINA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0mHD/2+Jjgd4kOgQdqrbw9FzJcac/KJqtYWIpEg8WyE=;
        b=o9Qs56U5T9NE8UjuAdP3U8oPTklqfsb/Njmcw+JYTUuaL9CV3c32YGZ48ZPIOFTrdO
         zUiCuKwV4GsjPBG+goWS7nPTyAYptUTxY7UU6pPmhyZ4WQb2IrqYmn37w6HcBynNZCEC
         SOBRbgKrU3pBzHvyjv6X1DtcV8r6T4U4Z0IRitezB3JOQQrf5fCemC1ZrsSuivVp6qYV
         Sp1DCHSSF+SL7vv/QO6epkHkAj56oiAmbQlGZCq+uUpXoWGbIN3wET3Eg2IWzyic5ViX
         AqwwMNYEAM0MGQc69Fs+4PAZxxdzCLxk6f7oWzcNOKIYRr9qDgr34IEBu1YUg6rSAqBg
         6cdw==
X-Gm-Message-State: AFqh2krHf46orir3EmnKbfMIb0+WLsRESR8b+4CgJ/GwOi6g2nXkrF1S
	BVSslMcF9n7jtg4KLR8zLB0=
X-Google-Smtp-Source: AMrXdXtZh277ePJQhQb3HkxJgmq2Hen7eTzHBHagoksuQWV6qFWkdnvAtSlg4XrApgQlhuoQScoCGw==
X-Received: by 2002:a05:6870:1f17:b0:144:b053:940 with SMTP id pd23-20020a0568701f1700b00144b0530940mr8530099oab.34.1672037333565;
        Sun, 25 Dec 2022 22:48:53 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c9-20020a056870b28900b0014474019e50sm4611376oao.24.2022.12.25.22.48.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Dec 2022 22:48:52 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 25 Dec 2022 22:48:50 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org,
	chrome-platform@lists.linux.dev
Subject: Re: [PATCH] platform/chrome: use sysfs_emit_at() instead of
 scnprintf()
Message-ID: <20221226064850.GA2564528@roeck-us.net>
References: <20221205061042.1774769-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221205061042.1774769-1-tzungbi@kernel.org>

On Mon, Dec 05, 2022 at 02:10:42PM +0800, Tzung-Bi Shih wrote:
> Follow the advice in Documentation/filesystems/sysfs.rst:
> show() should only use sysfs_emit() or sysfs_emit_at() when formatting
> the value to be returned to user space.
> 
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> Inspired by https://patchwork.kernel.org/project/chrome-platform/patch/202212021656040995199@zte.com.cn/
> 
>  drivers/platform/chrome/cros_ec_sysfs.c | 36 ++++++++++---------------
>  1 file changed, 14 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/platform/chrome/cros_ec_sysfs.c b/drivers/platform/chrome/cros_ec_sysfs.c
> index e45e57cee3a8..09e3bf5e8ec6 100644
> --- a/drivers/platform/chrome/cros_ec_sysfs.c
> +++ b/drivers/platform/chrome/cros_ec_sysfs.c
> @@ -27,10 +27,9 @@ static ssize_t reboot_show(struct device *dev,
>  {
>  	int count = 0;
>  
> -	count += scnprintf(buf + count, PAGE_SIZE - count,
> -			   "ro|rw|cancel|cold|disable-jump|hibernate|cold-ap-off");
> -	count += scnprintf(buf + count, PAGE_SIZE - count,
> -			   " [at-shutdown]\n");
> +	count += sysfs_emit_at(buf, count,
> +			       "ro|rw|cancel|cold|disable-jump|hibernate|cold-ap-off");
> +	count += sysfs_emit_at(buf, count, " [at-shutdown]\n");
>  	return count;
>  }
>  
> @@ -138,12 +137,9 @@ static ssize_t version_show(struct device *dev,
>  	/* Strings should be null-terminated, but let's be sure. */
>  	r_ver->version_string_ro[sizeof(r_ver->version_string_ro) - 1] = '\0';
>  	r_ver->version_string_rw[sizeof(r_ver->version_string_rw) - 1] = '\0';
> -	count += scnprintf(buf + count, PAGE_SIZE - count,
> -			   "RO version:    %s\n", r_ver->version_string_ro);
> -	count += scnprintf(buf + count, PAGE_SIZE - count,
> -			   "RW version:    %s\n", r_ver->version_string_rw);
> -	count += scnprintf(buf + count, PAGE_SIZE - count,
> -			   "Firmware copy: %s\n",
> +	count += sysfs_emit_at(buf, count, "RO version:    %s\n", r_ver->version_string_ro);
> +	count += sysfs_emit_at(buf, count, "RW version:    %s\n", r_ver->version_string_rw);
> +	count += sysfs_emit_at(buf, count, "Firmware copy: %s\n",
>  			   (r_ver->current_image < ARRAY_SIZE(image_names) ?
>  			    image_names[r_ver->current_image] : "?"));
>  
> @@ -152,13 +148,12 @@ static ssize_t version_show(struct device *dev,
>  	msg->insize = EC_HOST_PARAM_SIZE;
>  	ret = cros_ec_cmd_xfer_status(ec->ec_dev, msg);
>  	if (ret < 0) {
> -		count += scnprintf(buf + count, PAGE_SIZE - count,
> +		count += sysfs_emit_at(buf, count,
>  				   "Build info:    XFER / EC ERROR %d / %d\n",
>  				   ret, msg->result);
>  	} else {
>  		msg->data[EC_HOST_PARAM_SIZE - 1] = '\0';
> -		count += scnprintf(buf + count, PAGE_SIZE - count,
> -				   "Build info:    %s\n", msg->data);
> +		count += sysfs_emit_at(buf, count, "Build info:    %s\n", msg->data);
>  	}
>  
>  	/* Get chip info. */
> @@ -166,7 +161,7 @@ static ssize_t version_show(struct device *dev,
>  	msg->insize = sizeof(*r_chip);
>  	ret = cros_ec_cmd_xfer_status(ec->ec_dev, msg);
>  	if (ret < 0) {
> -		count += scnprintf(buf + count, PAGE_SIZE - count,
> +		count += sysfs_emit_at(buf, count,
>  				   "Chip info:     XFER / EC ERROR %d / %d\n",
>  				   ret, msg->result);
>  	} else {
> @@ -175,12 +170,9 @@ static ssize_t version_show(struct device *dev,
>  		r_chip->vendor[sizeof(r_chip->vendor) - 1] = '\0';
>  		r_chip->name[sizeof(r_chip->name) - 1] = '\0';
>  		r_chip->revision[sizeof(r_chip->revision) - 1] = '\0';
> -		count += scnprintf(buf + count, PAGE_SIZE - count,
> -				   "Chip vendor:   %s\n", r_chip->vendor);
> -		count += scnprintf(buf + count, PAGE_SIZE - count,
> -				   "Chip name:     %s\n", r_chip->name);
> -		count += scnprintf(buf + count, PAGE_SIZE - count,
> -				   "Chip revision: %s\n", r_chip->revision);
> +		count += sysfs_emit_at(buf, count, "Chip vendor:   %s\n", r_chip->vendor);
> +		count += sysfs_emit_at(buf, count, "Chip name:     %s\n", r_chip->name);
> +		count += sysfs_emit_at(buf, count, "Chip revision: %s\n", r_chip->revision);
>  	}
>  
>  	/* Get board version */
> @@ -188,13 +180,13 @@ static ssize_t version_show(struct device *dev,
>  	msg->insize = sizeof(*r_board);
>  	ret = cros_ec_cmd_xfer_status(ec->ec_dev, msg);
>  	if (ret < 0) {
> -		count += scnprintf(buf + count, PAGE_SIZE - count,
> +		count += sysfs_emit_at(buf, count,
>  				   "Board version: XFER / EC ERROR %d / %d\n",
>  				   ret, msg->result);
>  	} else {
>  		r_board = (struct ec_response_board_version *)msg->data;
>  
> -		count += scnprintf(buf + count, PAGE_SIZE - count,
> +		count += sysfs_emit_at(buf, count,
>  				   "Board version: %d\n",
>  				   r_board->board_version);
>  	}
