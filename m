Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE783209
	for <chrome-platform@lists.linux.dev>; Wed, 11 Jan 2023 16:32:32 +0000 (UTC)
Received: by mail-ua1-f47.google.com with SMTP id z23so3817462uae.7
        for <chrome-platform@lists.linux.dev>; Wed, 11 Jan 2023 08:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pxsM1DS9/LBds3AfOK48rHqAUpdBDjJGOWzD5+PKMYQ=;
        b=PpxTV+vFirGNEgVjJWNTnxUcPsQtwk1yPDeFdFkSCsApbJrHAKV2AjGyxWQjeuBo7b
         /BRwL14+Q+acBsQR6bEn7CkLkHDSm57cxLJybi9rs1M3RQP10LSwJ15/b6eX6I7mLX8r
         UqNXJr4CtETLvfFXuS7gxeygOe8GXXwS58X9Gj7ALhXtONcDtgAZDnvoO7INarXhIdFw
         oz2OTdCls/uT1NQsEa02pWBPDeqyn1VjqGbYm6qHp+DX5EwydFeuwQ3dEoueMU3rj7t+
         sLRlhfvEKaSulgm70fQ7tbi3cFsTeWrqD5rBYn0mui4GJa7KP1/y6FbROPVOyWlsBj8C
         puWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pxsM1DS9/LBds3AfOK48rHqAUpdBDjJGOWzD5+PKMYQ=;
        b=438CwOx5tQdzII3jVhcgfu0R8sx1E0kQueLl5hvz4Uwi3/bDgrJWODpBJYkJlNCzGU
         /2Iu4W94nERjCbfxZexRFbOPqXDytOyTynNK4dgx/4gc0S/Pi0bTh8wYGwdBolIR8VOL
         XDwdaV1pGp9JUDtR8RJ6QmYiNZCycWzCB7Xq3lnooEfp5Xoi0jbuslQLYfdv0ATVTZkq
         tfwwUSo0OvY9ya5xT2NonwRKUmezQtvi/3IDNS9C8ZXUjLT28//WGC9ZzDDEehmkUrBx
         2tXB3t9g5dOADopqr9ADFoc0RydzNkNFKzyZFFWvcyWGVej4LFsdFd2EmpaHrZpmduTZ
         Fvsw==
X-Gm-Message-State: AFqh2krajnk3OB5GZX5P1LGJ+UaBHelzs0Vr9Ony5eclTi4qMMKd+A+x
	hndiQwkoNPOFBN3yo0RGqg6tboHxQWXSaTlsYLieyA==
X-Google-Smtp-Source: AMrXdXswUoASvRNS6jXC+Lti4QXeTCEN45csHUGD5gIuov3Vz8OZdIaXt0gLc6rSCxaIh0nSAOOi+z3QxWSIPy/2Dkg=
X-Received: by 2002:ab0:7506:0:b0:5d0:8b4e:21cd with SMTP id
 m6-20020ab07506000000b005d08b4e21cdmr2922822uap.73.1673454751337; Wed, 11 Jan
 2023 08:32:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230111055728.708990-1-tzungbi@kernel.org> <20230111055728.708990-5-tzungbi@kernel.org>
In-Reply-To: <20230111055728.708990-5-tzungbi@kernel.org>
From: Guenter Roeck <groeck@google.com>
Date: Wed, 11 Jan 2023 08:32:20 -0800
Message-ID: <CABXOdTegvBHTj3jJYa89TUUw1cSeTnu_-ffUVKiEZsk+P=nzLQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] platform/chrome: fix kernel-doc warnings for cros_ec_command
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 10, 2023 at 9:58 PM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
>
> Fix the following kernel-doc warnings:
>
> $ ./scripts/kernel-doc -none \
>         include/linux/platform_data/cros_ec_commands.h
> include/linux/platform_data/cros_ec_commands.h:1092: warning: expecting
> prototype for struct ec_response_get_cmd_version. Prototype was for
> struct ec_response_get_cmd_versions instead
> include/linux/platform_data/cros_ec_commands.h:5485: warning: This
> comment starts with '/**', but isn't a kernel-doc comment.
> include/linux/platform_data/cros_ec_commands.h:5496: warning: This
> comment starts with '/**', but isn't a kernel-doc comment.
>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---
>  include/linux/platform_data/cros_ec_commands.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/include/linux/platform_data/cros_ec_commands.h b/include/linux/platform_data/cros_ec_commands.h
> index 6665e7da6ee2..b9c4a3964247 100644
> --- a/include/linux/platform_data/cros_ec_commands.h
> +++ b/include/linux/platform_data/cros_ec_commands.h
> @@ -1082,7 +1082,7 @@ struct ec_params_get_cmd_versions_v1 {
>  } __ec_align2;
>
>  /**
> - * struct ec_response_get_cmd_version - Response to the get command versions.
> + * struct ec_response_get_cmd_versions - Response to the get command versions.
>   * @version_mask: Mask of supported versions; use EC_VER_MASK() to compare with
>   *                a desired version.
>   */
> @@ -5480,7 +5480,7 @@ struct ec_response_rollback_info {
>  /* Issue AP reset */
>  #define EC_CMD_AP_RESET 0x0125
>
> -/**
> +/*
>   * Get the number of peripheral charge ports
>   */
>  #define EC_CMD_PCHG_COUNT 0x0134
> @@ -5491,7 +5491,7 @@ struct ec_response_pchg_count {
>         uint8_t port_count;
>  } __ec_align1;
>
> -/**
> +/*
>   * Get the status of a peripheral charge port
>   */
>  #define EC_CMD_PCHG 0x0135
> --
> 2.39.0.314.g84b9a713c41-goog
>
