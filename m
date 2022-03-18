Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 516164C99
	for <chrome-platform@lists.linux.dev>; Fri, 18 Mar 2022 17:59:34 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id f38so17196995ybi.3
        for <chrome-platform@lists.linux.dev>; Fri, 18 Mar 2022 10:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dfw1kA3nIxLHYmDOCE9motx9bUMKsfhVC4jp+a1sZpo=;
        b=pv0iRmsoVD4KO7DrYkkMY8FDrFi5Zg2xDZQ6TN+pYrhw/xhtJLHhsQq9oAKo+nJYSg
         W8/WtMu1JMZSQ4/ROOsYZrihNXAFwxQzJ9nNBz4yQJ2tLeRPGyXOFZ0utg7DcQq0wAhV
         O2glN2RJxYQi70H/s+ionPWWYvjEAlkIbBEBBQe6oKXU4pieI6JvJ7scL1+2pbXQQo9g
         EU5RrUPy0ZwD4k0JCuOIeT9jCa0reAY34E9G+/pUOrtvuNTbHg4D6yIUDdQUdQjCvYCp
         XPnrRISaeg0/u3EbSj10AGlOY/jIDrVCHlFCew5/sKsRa73n2D06EyqwJDeU8hA5HaHs
         bpwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dfw1kA3nIxLHYmDOCE9motx9bUMKsfhVC4jp+a1sZpo=;
        b=lkcuQeGXWmb2I+MoyBZ3oeGZX8gL2G+Gm53DOHtd3mGqFkeNQoe3csIY80dmxc3O5s
         mJAJnngqYFLOZXJwLr5r2ZKaPLrx9KIEp5F6erAAiHqsxN2Af3e2ixwHRqRBTN51+1L/
         PGEvWlAQCF7v1kxRiUcQ58OlL0PIAd0z2231coWo3sigRhYALcrpQgj6kRALduFbETxl
         Q6pROblq6pRRG48DCRM3AGrB/s+zwdZnxUeiBeo+7Ff5vprwuJtJic3RmaArCNytlgNq
         TkkenW9f7apilyT350WCiURwlCVD1XI6SpZMLYiXE6L1WAN5poBiPOkBsWLCP6ii0uBl
         I1oA==
X-Gm-Message-State: AOAM531d8QmenQLX6t5ZfM+9oVjtW4+OfxSpElyHHwPkNSZNUYGhJFkg
	Wi1zzY5WqrbMAhAL/IPTjRdEITDuG9jGcmXu8wIwqw==
X-Google-Smtp-Source: ABdhPJxroOIO2dOunld2xtM5Bzg30PoZLvnU2nWraSyDou+b9KEVHl8OfSjHMGxtewQiNrzftGvQSNudgpgN1jtF/JY=
X-Received: by 2002:a25:18c1:0:b0:633:7a25:5c39 with SMTP id
 184-20020a2518c1000000b006337a255c39mr11501863yby.177.1647626373036; Fri, 18
 Mar 2022 10:59:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220318165422.686848-1-linux@roeck-us.net>
In-Reply-To: <20220318165422.686848-1-linux@roeck-us.net>
From: Daisuke Nojiri <dnojiri@google.com>
Date: Fri, 18 Mar 2022 10:59:22 -0700
Message-ID: <CAC0y+Ah_YbD+ScZmF=PUhGndpj_LH2pAG-sMDRo0c-4VApc-5A@mail.gmail.com>
Subject: Re: [PATCH v2] platform/chrome: Re-introduce cros_ec_cmd_xfer and use
 it for ioctls
To: Guenter Roeck <linux@roeck-us.net>
Cc: Benson Leung <bleung@chromium.org>, chrome-platform@lists.linux.dev, 
	linux-kernel <linux-kernel@vger.kernel.org>, Daisuke Nojiri <dnojiri@chromium.org>, 
	Rob Barnes <robbarnes@google.com>, Rajat Jain <rajatja@google.com>, 
	Brian Norris <briannorris@chromium.org>, Parth Malkan <parthmalkan@google.com>
Content-Type: text/plain; charset="UTF-8"

The comment looks good to me. The rest also looks good to me (based on
the FROMLIST patch on Gerrit).


On Fri, Mar 18, 2022 at 9:56 AM Guenter Roeck <linux@roeck-us.net> wrote:
>
> Commit 413dda8f2c6f ("platform/chrome: cros_ec_chardev: Use
> cros_ec_cmd_xfer_status helper") inadvertendly changed the userspace ABI.
> Previously, cros_ec ioctls would only report errors if the EC communication
> failed, and otherwise return success and the result of the EC
> communication. An EC command execution failure was reported in the EC
> response field. The above mentioned commit changed this behavior, and the
> ioctl itself would fail. This breaks userspace commands trying to analyze
> the EC command execution error since the actual EC command response is no
> longer reported to userspace.
>
> Fix the problem by re-introducing the cros_ec_cmd_xfer() helper, and use it
> to handle ioctl messages.
>
> Fixes: 413dda8f2c6f ("platform/chrome: cros_ec_chardev: Use cros_ec_cmd_xfer_status helper")
> Cc: Daisuke Nojiri <dnojiri@chromium.org>
> Cc: Rob Barnes <robbarnes@google.com>
> Cc: Rajat Jain <rajatja@google.com>
> Cc: Brian Norris <briannorris@chromium.org>
> Cc: Parth Malkan <parthmalkan@google.com>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
> v2: Updated comments / return value description. No functional change.
>
>  drivers/platform/chrome/cros_ec_chardev.c   |  2 +-
>  drivers/platform/chrome/cros_ec_proto.c     | 50 +++++++++++++++++----
>  include/linux/platform_data/cros_ec_proto.h |  3 ++
>  3 files changed, 45 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/platform/chrome/cros_ec_chardev.c b/drivers/platform/chrome/cros_ec_chardev.c
> index e0bce869c49a..fd33de546aee 100644
> --- a/drivers/platform/chrome/cros_ec_chardev.c
> +++ b/drivers/platform/chrome/cros_ec_chardev.c
> @@ -301,7 +301,7 @@ static long cros_ec_chardev_ioctl_xcmd(struct cros_ec_dev *ec, void __user *arg)
>         }
>
>         s_cmd->command += ec->cmd_offset;
> -       ret = cros_ec_cmd_xfer_status(ec->ec_dev, s_cmd);
> +       ret = cros_ec_cmd_xfer(ec->ec_dev, s_cmd);
>         /* Only copy data to userland if data was received. */
>         if (ret < 0)
>                 goto exit;
> diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
> index c4caf2e2de82..ac1419881ff3 100644
> --- a/drivers/platform/chrome/cros_ec_proto.c
> +++ b/drivers/platform/chrome/cros_ec_proto.c
> @@ -560,22 +560,28 @@ int cros_ec_query_all(struct cros_ec_device *ec_dev)
>  EXPORT_SYMBOL(cros_ec_query_all);
>
>  /**
> - * cros_ec_cmd_xfer_status() - Send a command to the ChromeOS EC.
> + * cros_ec_cmd_xfer() - Send a command to the ChromeOS EC.
>   * @ec_dev: EC device.
>   * @msg: Message to write.
>   *
> - * Call this to send a command to the ChromeOS EC. This should be used instead of calling the EC's
> - * cmd_xfer() callback directly. It returns success status only if both the command was transmitted
> - * successfully and the EC replied with success status.
> + * Call this to send a command to the ChromeOS EC. This should be used instead
> + * of calling the EC's cmd_xfer() callback directly. This function does not
> + * convert EC command execution error codes to Linux error codes. Most
> + * in-kernel users will want to use cros_ec_cmd_xfer_status() instead since
> + * that function implements the conversion.
>   *
>   * Return:
> - * >=0 - The number of bytes transferred
> - * <0 - Linux error code
> + * >0 - EC command was executed successfully. The return value is the number
> + *      of bytes returned by the EC (excluding the header).
> + * =0 - EC communication was successful. EC command execution results are
> + *      reported in msg->result. The result will be EC_RES_SUCCESS if the
> + *      command was executed successfully or report an EC command execution
> + *      error.
> + * <0 - EC communication error. Return value is the Linux error code.
>   */
> -int cros_ec_cmd_xfer_status(struct cros_ec_device *ec_dev,
> -                           struct cros_ec_command *msg)
> +int cros_ec_cmd_xfer(struct cros_ec_device *ec_dev, struct cros_ec_command *msg)
>  {
> -       int ret, mapped;
> +       int ret;
>
>         mutex_lock(&ec_dev->lock);
>         if (ec_dev->proto_version == EC_PROTO_VERSION_UNKNOWN) {
> @@ -616,6 +622,32 @@ int cros_ec_cmd_xfer_status(struct cros_ec_device *ec_dev,
>         ret = send_command(ec_dev, msg);
>         mutex_unlock(&ec_dev->lock);
>
> +       return ret;
> +}
> +EXPORT_SYMBOL(cros_ec_cmd_xfer);
> +
> +/**
> + * cros_ec_cmd_xfer_status() - Send a command to the ChromeOS EC.
> + * @ec_dev: EC device.
> + * @msg: Message to write.
> + *
> + * Call this to send a command to the ChromeOS EC. This should be used instead of calling the EC's
> + * cmd_xfer() callback directly. It returns success status only if both the command was transmitted
> + * successfully and the EC replied with success status.
> + *
> + * Return:
> + * >=0 - The number of bytes transferred.
> + * <0 - Linux error code
> + */
> +int cros_ec_cmd_xfer_status(struct cros_ec_device *ec_dev,
> +                           struct cros_ec_command *msg)
> +{
> +       int ret, mapped;
> +
> +       ret = cros_ec_cmd_xfer(ec_dev, msg);
> +       if (ret < 0)
> +               return ret;
> +
>         mapped = cros_ec_map_error(msg->result);
>         if (mapped) {
>                 dev_dbg(ec_dev->dev, "Command result (err: %d [%d])\n",
> diff --git a/include/linux/platform_data/cros_ec_proto.h b/include/linux/platform_data/cros_ec_proto.h
> index df3c78c92ca2..16931569adce 100644
> --- a/include/linux/platform_data/cros_ec_proto.h
> +++ b/include/linux/platform_data/cros_ec_proto.h
> @@ -216,6 +216,9 @@ int cros_ec_prepare_tx(struct cros_ec_device *ec_dev,
>  int cros_ec_check_result(struct cros_ec_device *ec_dev,
>                          struct cros_ec_command *msg);
>
> +int cros_ec_cmd_xfer(struct cros_ec_device *ec_dev,
> +                    struct cros_ec_command *msg);
> +
>  int cros_ec_cmd_xfer_status(struct cros_ec_device *ec_dev,
>                             struct cros_ec_command *msg);
>
> --
> 2.35.1
>
