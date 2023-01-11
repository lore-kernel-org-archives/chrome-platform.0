Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52CF2F2E
	for <chrome-platform@lists.linux.dev>; Wed, 11 Jan 2023 16:32:09 +0000 (UTC)
Received: by mail-vk1-f176.google.com with SMTP id s192so5142414vka.3
        for <chrome-platform@lists.linux.dev>; Wed, 11 Jan 2023 08:32:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HIUuvBhuTpY1v+DsQta8kZO2ibnhp3QYjg3xyUUemds=;
        b=Fzu6LDce+8FpBnJI+p08/44jB/VKh1/W3sVggLkwVRen1A5sqD9snermTWXrPTsVK5
         AMsBeo0bcubFPLYg7S5uFt6hTVKNoZVtSD3jfxStYhNocywBARMnJGv0sX+3n4JeQIyx
         1pMQv7RxDgPPLtUKBquqqug2AZU5lmY6SgDc28ZQ8teU42Pcv/YC8K7i1qMeMP6UCUIL
         /HjjF8enb1D5tRHyuyhuDURH15PpcoRMI7oW3nfVDpr9QdGEeGscCIYffhwAT7nXooB9
         xjrvTOtg6aX60RJ2s2D5eOIG5sjY2cZlgEJTIbrJdFJ/kNbXYtrtrnpZ9ZELEaQA3Tg+
         A4RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HIUuvBhuTpY1v+DsQta8kZO2ibnhp3QYjg3xyUUemds=;
        b=KrWWqo1vIwc1VQ8sHzmVPkcyJ7b2s+uB6jtLQsAn0jY8epthr9qUfhrm4dALyvLOsO
         urmDmI9E2XfdNYCOFxZQKNJI0DlldZRqOMnz2NkM7bZCevq0CXir3iMEfajAcJbw3gFb
         Mc4oyiAz86ez6k+z/BYh1jFUjLZDnb5/29wkJuwMSbPHvv9SryfhVGYuVXqJkgxRU+vd
         E16+1oIwE4bthMAvo+nXKLQtF3KQw4ajik0u/+GjO2xV6gtPXlYFPj2yOLeg4Izfobd/
         /AfMyXIKoWMLxBOkXZ08BU9K+KgO+Q/og40xGfR3KiFkuJaTmMavcOpRdjqOGTfv57vs
         d0kA==
X-Gm-Message-State: AFqh2koOM9RizG4+QlK0QSjVyFTRAlGbVCsSGNjmc/m2woIzZ29Rw1pN
	XRlPeA3D93rMWej+Ebp6qEaB+52a3yBFMdrECGY2Bw==
X-Google-Smtp-Source: AMrXdXsbXuuKh+yvLYSACQaxQfth1zK9JxHKZc8eYnAKp0UarjQe3d8eygWqOGYBL6za0BoVa2fi6g0t7VgX2i9jGB0=
X-Received: by 2002:a1f:2fca:0:b0:3d5:8aad:7ecc with SMTP id
 v193-20020a1f2fca000000b003d58aad7eccmr6017701vkv.19.1673454728682; Wed, 11
 Jan 2023 08:32:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230111055728.708990-1-tzungbi@kernel.org> <20230111055728.708990-4-tzungbi@kernel.org>
In-Reply-To: <20230111055728.708990-4-tzungbi@kernel.org>
From: Guenter Roeck <groeck@google.com>
Date: Wed, 11 Jan 2023 08:31:57 -0800
Message-ID: <CABXOdTdfUFwHORVdx_+MHA5rq=6eZvV=R__TvpnHFr+ezrQnSg@mail.gmail.com>
Subject: Re: [PATCH 3/4] platform/chrome: fix kernel-doc warning for last_resume_result
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, chrome-platform@lists.linux.dev, 
	Evan Green <evgreen@chromium.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 10, 2023 at 9:58 PM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
>
> Fix the following kernel-doc warning:
>
> $ ./scripts/kernel-doc -none include/linux/platform_data/cros_ec_proto.h
> include/linux/platform_data/cros_ec_proto.h:187: warning: Function
> parameter or member 'last_resume_result' not described in 'cros_ec_device'
>
> Cc: Evan Green <evgreen@chromium.org>
> Fixes: 8c3166e17cf1 ("mfd / platform: cros_ec_debugfs: Expose resume result via debugfs")
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---
>  include/linux/platform_data/cros_ec_proto.h | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/include/linux/platform_data/cros_ec_proto.h b/include/linux/platform_data/cros_ec_proto.h
> index 805dcb19a36d..4865c54d4af1 100644
> --- a/include/linux/platform_data/cros_ec_proto.h
> +++ b/include/linux/platform_data/cros_ec_proto.h
> @@ -136,6 +136,10 @@ struct cros_ec_command {
>   *                      transition failure if the sleep signal is not
>   *                      asserted.  See also struct
>   *                      ec_params_host_sleep_event_v1 in cros_ec_commands.h.
> + * @last_resume_result: The number of sleep power signal transitions that
> + *                      occurred since the suspend message. The high bit
> + *                      indicates a timeout occurred.  See also struct
> + *                      ec_response_host_sleep_event_v1 in cros_ec_commands.h.
>   * @last_event_time: exact time from the hard irq when we got notified of
>   *     a new event.
>   * @notifier_ready: The notifier_block to let the kernel re-query EC
> --
> 2.39.0.314.g84b9a713c41-goog
>
