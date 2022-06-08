Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0319A7B
	for <chrome-platform@lists.linux.dev>; Wed,  8 Jun 2022 16:23:36 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id n28so27808427edb.9
        for <chrome-platform@lists.linux.dev>; Wed, 08 Jun 2022 09:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pH4epaydulKCzm3U0hT80dPoBBzbWjC5FDf9U06Ouz8=;
        b=tMTpHgPJK0KyZNMjbhcDWL+vqGFG2psfpD5M2hMow/ED0ef+1jqkEF2DPMcXDtg9AS
         0v+y4629bTKsvDEYpEJemWcGM8AwbP5sF8wEy+4mGUpTTeSeKHEXZf48b8dkyrmIXCUM
         DshaUPivp1CGYDKctrAgC0CP3WNoCJ+p/35s/nIudJalTXkOmw0IO/3COjzVMn1zLV0F
         ES8xpuQS481oxGbdY1RKg94oK8c/IMdydGSeOhy5aCD6A9zoxdcEMO04i3qz5BB/FxQ8
         kGPHfZFs10j1st2K9015vZgWp3q4xRP9cHxPZ50jGd+J2ug81VEalkABs9wZL5uskKTh
         3vPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pH4epaydulKCzm3U0hT80dPoBBzbWjC5FDf9U06Ouz8=;
        b=z+jKMJZA+YngWijsdyWR/GXYZYz7pC7p6Jrc/6cNY6NvrCduLGDOh1rWyAT4o/vznw
         TQmOCYXsFi9iMenAG1c4V8+4mMb+flvyZhC6Y/8xQ2ZNYZnOghfZReCBuXcSxLmzu+tl
         Tyxq/2V+5H5Oii+3JIsdzgJIB+hZ3W4Vob4z62vNnzka+Y6C1rUmlY0XTpdXi3uMqGBC
         QtXUtILqy9cZWlr2wcPTN4LO7Lxgz9Ru/pmQRb9ZhvwFZ+1rM6AgszFO9nx/iGvjvWD1
         0e90LAIEv0VXwL22nfNOuFdeYgDox8GpeTsAJkCcYvHCPfTis4RlgT7RIfmi/8LJ8rGI
         SyTA==
X-Gm-Message-State: AOAM532F5zrZ9KQ1RRP47mB0PfNgRlEizsSZO16x9Vraqjbk4WIVAbsC
	OTZKtScwQ4K6tt25iULqlO6G0c7dVTQ10JiNzLHwBw==
X-Google-Smtp-Source: ABdhPJxurra4SbiWW25ogvhvTo8GI/+sQDJfMtYjH3WfGqpMoXwQFHkMqBfu4kaXiqns0Jj5Xl/Rak/TNkL80+JPotg=
X-Received: by 2002:a05:6402:2405:b0:431:6ef1:e2a with SMTP id
 t5-20020a056402240500b004316ef10e2amr16357932eda.26.1654705414971; Wed, 08
 Jun 2022 09:23:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220608110734.2928245-1-tzungbi@kernel.org> <20220608110734.2928245-19-tzungbi@kernel.org>
In-Reply-To: <20220608110734.2928245-19-tzungbi@kernel.org>
From: Guenter Roeck <groeck@google.com>
Date: Wed, 8 Jun 2022 09:23:23 -0700
Message-ID: <CABXOdTdPwO6xv+DPcErZJcqZsLMMECcuk5MEYEpf4L3PYhSh7g@mail.gmail.com>
Subject: Re: [PATCH v3 18/23] platform/chrome: cros_ec_proto: check
 `msg->result` in getting cmd mask
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	"open list:CHROME HARDWARE PLATFORM SUPPORT" <chrome-platform@lists.linux.dev>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 8, 2022 at 4:08 AM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
>
> cros_ec_get_host_command_version_mask() should check if EC wasn't happy
> by checking `msg->result`.
>
> Use cros_ec_map_error() and return the error code if any.
>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> ---
> No v2.  New and separated from the original series.
>
>  drivers/platform/chrome/cros_ec_proto.c | 21 +++++++++++++--------
>  1 file changed, 13 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
> index 06bc7db1213e..6a5771361383 100644
> --- a/drivers/platform/chrome/cros_ec_proto.c
> +++ b/drivers/platform/chrome/cros_ec_proto.c
> @@ -428,13 +428,12 @@ static int cros_ec_get_proto_info_legacy(struct cros_ec_device *ec_dev)
>   * the caller has ec_dev->lock mutex or the caller knows there is
>   * no other command in progress.
>   */
> -static int cros_ec_get_host_command_version_mask(struct cros_ec_device *ec_dev,
> -       u16 cmd, u32 *mask)
> +static int cros_ec_get_host_command_version_mask(struct cros_ec_device *ec_dev, u16 cmd, u32 *mask)
>  {
>         struct ec_params_get_cmd_versions *pver;
>         struct ec_response_get_cmd_versions *rver;
>         struct cros_ec_command *msg;
> -       int ret;
> +       int ret, mapped;
>
>         msg = kmalloc(sizeof(*msg) + max(sizeof(*rver), sizeof(*pver)),
>                       GFP_KERNEL);
> @@ -450,14 +449,20 @@ static int cros_ec_get_host_command_version_mask(struct cros_ec_device *ec_dev,
>         pver->cmd = cmd;
>
>         ret = send_command(ec_dev, msg);
> -       if (ret > 0) {
> -               rver = (struct ec_response_get_cmd_versions *)msg->data;
> -               *mask = rver->version_mask;
> -               ret = 0;
> +       if (ret < 0)
> +               goto exit;
> +
> +       mapped = cros_ec_map_error(msg->result);
> +       if (mapped) {
> +               ret = mapped;
> +               goto exit;
>         }
>
What if ret == 0 ? Is that valid ?

Thanks,
Guenter

> +       rver = (struct ec_response_get_cmd_versions *)msg->data;
> +       *mask = rver->version_mask;
> +       ret = 0;
> +exit:
>         kfree(msg);
> -
>         return ret;
>  }
>
> --
> 2.36.1.255.ge46751e96f-goog
>
