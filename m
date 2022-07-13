Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03C24A00
	for <chrome-platform@lists.linux.dev>; Wed, 13 Jul 2022 18:24:11 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id x91so15205984ede.1
        for <chrome-platform@lists.linux.dev>; Wed, 13 Jul 2022 11:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aIstVleI5wOdnOiH/laD0icGVhvC0xTlsJeuVPlERzc=;
        b=eJtnAfCBo1bvcrDYMRslDTvpifIcKxQpQDw1j1O+JAPa0g4MuUPseIE0mzfD/lAX4B
         gBKJTam4L3/43Umw6PpQvgLQrPEo7CWDkcVRg0M+Pr0J4BvzNg8h/cqCnAzTlWijKyfx
         HRlV7MgVXQWviTwYkaK4JnvgiRQVFt32LZGxkPqq59/5XAGC1ivf1GWCRk/XP8Nfm6Fk
         /h5VTB9XJRIGXcHuRVYBP7FeLM8pl2ryP19MsI4VK/AW5HowltRFCerqEDiK928SB9Z3
         pOIDl3eTqN2s2RGwGgHH6t6qvleuNrXSbZi/J8B/qf2vZ2RKMZ+GU2o0lZtZmjEu2NcN
         oEQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aIstVleI5wOdnOiH/laD0icGVhvC0xTlsJeuVPlERzc=;
        b=pmhFqgL3zEbov6vViyeylCMkk1WyI+ZRs7ayigenO0WkKl+GV2LuoueCNo+w8Uvr7Z
         tf6Bp3KgLMnmElpB4uVvwfMMabhrQOt5BK/iubjUclTLsbqjS+TebxY9sr+3bOSd9PMd
         ktVjjwHb5A9ODpPcH9C9D4svupQDV5NJJLzOYcozINzXVcHOGvu7r/4Z98bsJiJh24dp
         TY3A2nG2yRe/WGcHwverpeFCjtNuglDEXvO5QHMXpiHtYigcizcXNtX0kU8m2lkEHqZt
         gLl4xQRXNGuFCsVTon4XLZ4NChVrumGFvvYaQnEVkCcC0xuJpCqtid2PtVFTZYGkkaU+
         z2FQ==
X-Gm-Message-State: AJIora/FmURXOxGn+KqDO6+e4U2wcM1VGIVP8oVqrmXdyssC4QNdP+gF
	LlZ8EoeAl/hdHDaZQvsgMaQShcistI/WbeXs9VJqZg==
X-Google-Smtp-Source: AGRyM1v7XZi2EVvKT8MqJNjBZh774qZrYgHjj7ePEk9gcG/l1sBN8cEdgRGM0cdSU6c9mRtKCBB7jSyxL5xGE0jICIw=
X-Received: by 2002:a05:6402:50d0:b0:43a:df6d:6f4d with SMTP id
 h16-20020a05640250d000b0043adf6d6f4dmr6757899edb.72.1657736649926; Wed, 13
 Jul 2022 11:24:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220628024913.1755292-1-tzungbi@kernel.org> <20220628024913.1755292-10-tzungbi@kernel.org>
In-Reply-To: <20220628024913.1755292-10-tzungbi@kernel.org>
From: Guenter Roeck <groeck@google.com>
Date: Wed, 13 Jul 2022 11:23:58 -0700
Message-ID: <CABXOdTeCFsXYdd6uVDYkOY-tGno_wW-ZyuMb44a63tFABic+NA@mail.gmail.com>
Subject: Re: [RESEND PATCH 09/11] platform/chrome: cros_ec_proto: return
 standard error codes for EC errors
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	"open list:CHROME HARDWARE PLATFORM SUPPORT" <chrome-platform@lists.linux.dev>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 27, 2022 at 7:49 PM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
>
> cros_ec_wait_until_complete() checks `msg->result` for
> EC_CMD_GET_COMMS_STATUS.  However, it doesn't return standard error codes
> like most of others.

The callers of cros_ec_send_command() do the mapping. I am not sure if
it is a good idea to change that; it may have undesired side effects
(such as changing the userspace ABI) for callers of
cros_ec_send_command() not expecting this change. It would also result
in double mapping in some situations.

Guenter

>
> Use cros_ec_map_error() to align them.
>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> ---
>  drivers/platform/chrome/cros_ec_proto.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
> index 49772a4c5353..5323edddb540 100644
> --- a/drivers/platform/chrome/cros_ec_proto.c
> +++ b/drivers/platform/chrome/cros_ec_proto.c
> @@ -138,7 +138,7 @@ static int cros_ec_wait_until_complete(struct cros_ec_device *ec_dev, uint32_t *
>  {
>         struct cros_ec_command *msg;
>         struct ec_response_get_comms_status *status;
> -       int ret = 0, i;
> +       int ret = 0, i, mapped;
>
>         msg = kzalloc(sizeof(*msg) + sizeof(*status), GFP_KERNEL);
>         if (!msg)
> @@ -160,8 +160,11 @@ static int cros_ec_wait_until_complete(struct cros_ec_device *ec_dev, uint32_t *
>                         break;
>
>                 *result = msg->result;
> -               if (msg->result != EC_RES_SUCCESS)
> +               mapped = cros_ec_map_error(msg->result);
> +               if (mapped) {
> +                       ret = mapped;
>                         break;
> +               }
>
>                 if (!(status->flags & EC_COMMS_STATUS_PROCESSING))
>                         break;
> --
> 2.37.0.rc0.161.g10f37bed90-goog
>
