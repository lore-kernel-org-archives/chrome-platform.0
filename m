Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79D3417FF
	for <chrome-platform@lists.linux.dev>; Wed, 11 Jan 2023 16:31:40 +0000 (UTC)
Received: by mail-vs1-f50.google.com with SMTP id i185so16281285vsc.6
        for <chrome-platform@lists.linux.dev>; Wed, 11 Jan 2023 08:31:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bTbzGiAMEOEcjQ1EdKbJl8YlgU2sG+c5NKms/9MvXKE=;
        b=RSPcxPjxZhra89MazYzeIriOUB92LWF/DyntBZjW4hKoiiNZKNq+a7wI7flKAVn8kk
         UqtuT27+e6q6h2SWWxwDtQD0Y0yEdJHA+eaIZu7NF1cpx0xKUeRv3jyejsYawppup6oj
         lUNGoyuSMMWtfJhuj8r7/cxL2Wu6ZdVjE3b0HuvMERZkR46vSqht88W0h/fiyJasr5fo
         wVOr7rxMpGILgC3WiF8Mt2vOSl2+5OffVSSQZhJBqL84YtLOMuImoGQJrO0npBFSBmGD
         /j1+I3jr/xstG/FjSCPT7BSh0pI8ActqLHZVEGUsOCshC0z0mm2tykbL3VJBGbem0wwq
         /T/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bTbzGiAMEOEcjQ1EdKbJl8YlgU2sG+c5NKms/9MvXKE=;
        b=u4KkOyGbuVvJXwwaS7l6csiu/ToJvPk8Pi/DCFjfuK51NCc6vMSXWNT/3XLtNZ1qG7
         kH0GTKvteIfkTN6L58RjVIgP5HGsZqKt93yr41GbETtdN7TWqVU/IYhHwlUmCVrEzNmX
         1NVCLzqXfZig9grWqEJKcH625eEOW27F+OJ/fmXpiQ42/Der8GfPoScDE3NjaSxJD0Qo
         4xKnLNgY7y+uDB2L6+JRhMAt4hJErWJk+LZL+ot6Ahkdofpz5EG+0PJY0zehnks3NJSZ
         7btD9SxWVTAJIV7KquILsvhiDMBVv/wJTDabPtPTEE7NT2i2+iabjb1h4H19/8pX6duw
         zNSQ==
X-Gm-Message-State: AFqh2ko0FJpGxUiFHLhQq1z71YJl28ck24GGIuWVUviUMUbZN9HPJaVR
	cRdPMrdxLtHrVjnW5VOLfkNB9GYRdEuEPbSxgcD8kw==
X-Google-Smtp-Source: AMrXdXt/gxUnqbfHMeFltnkhuc7Xw3SmQBXoMRS4FeZKRmt0dXY2Q2Lo/Bi+LjwRiBs8gz70oWNWGQak8NN2t7W7+Qc=
X-Received: by 2002:a05:6102:390a:b0:3cb:141e:2929 with SMTP id
 e10-20020a056102390a00b003cb141e2929mr9056438vsu.29.1673454699201; Wed, 11
 Jan 2023 08:31:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230111055728.708990-1-tzungbi@kernel.org> <20230111055728.708990-3-tzungbi@kernel.org>
In-Reply-To: <20230111055728.708990-3-tzungbi@kernel.org>
From: Guenter Roeck <groeck@google.com>
Date: Wed, 11 Jan 2023 08:31:28 -0800
Message-ID: <CABXOdTd5WpqPjhrBzxL=Jf3cqBRmywV2aQc0ad7J2W37AjajsA@mail.gmail.com>
Subject: Re: [PATCH 2/4] platform/chrome: fix kernel-doc warning for suspend_timeout_ms
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, chrome-platform@lists.linux.dev, 
	Evan Green <evgreen@chromium.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 10, 2023 at 9:57 PM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
>
> Fix the following kernel-doc warning:
>
> $ ./scripts/kernel-doc -none include/linux/platform_data/cros_ec_proto.h
> include/linux/platform_data/cros_ec_proto.h:187: warning: Function
> parameter or member 'suspend_timeout_ms' not described in 'cros_ec_device'
>
> Cc: Evan Green <evgreen@chromium.org>
> Fixes: e8bf17d58a4d ("platform/chrome: cros_ec: Expose suspend_timeout_ms in debugfs")
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---
>  include/linux/platform_data/cros_ec_proto.h | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/include/linux/platform_data/cros_ec_proto.h b/include/linux/platform_data/cros_ec_proto.h
> index a4a3fec15504..805dcb19a36d 100644
> --- a/include/linux/platform_data/cros_ec_proto.h
> +++ b/include/linux/platform_data/cros_ec_proto.h
> @@ -131,6 +131,11 @@ struct cros_ec_command {
>   * @event_data: Raw payload transferred with the MKBP event.
>   * @event_size: Size in bytes of the event data.
>   * @host_event_wake_mask: Mask of host events that cause wake from suspend.
> + * @suspend_timeout_ms: The timeout in milliseconds between when sleep event
> + *                      is received and when the EC will declare sleep
> + *                      transition failure if the sleep signal is not
> + *                      asserted.  See also struct
> + *                      ec_params_host_sleep_event_v1 in cros_ec_commands.h.
>   * @last_event_time: exact time from the hard irq when we got notified of
>   *     a new event.
>   * @notifier_ready: The notifier_block to let the kernel re-query EC
> --
> 2.39.0.314.g84b9a713c41-goog
>
