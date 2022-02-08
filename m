Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561A02C80
	for <chrome-platform@lists.linux.dev>; Tue,  8 Feb 2022 06:04:39 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id 192so20685142ybd.10
        for <chrome-platform@lists.linux.dev>; Mon, 07 Feb 2022 22:04:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kvgkdpHYOT9hT97Eiz4ThApHg16vK+7+EjSGNAq5fVs=;
        b=Q/wFyU1ox5X6pXRZj19yAZ3gCpmA62oayq/7m6jnZMsVZ8/Gtg7ZwNdQf7cps7FYHn
         5nNHP3r1aOE4zFoyot/Bb6oDUREC4MtH+FabIl7eEARuEJl84eAfXgkY6cYms+Qr2MqZ
         a2xkD1VfJxVSRzcALlYe2LvQRElYvV9I2zUsA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kvgkdpHYOT9hT97Eiz4ThApHg16vK+7+EjSGNAq5fVs=;
        b=rOivEB3IY4YP1G3Ggzy8OAusbp8ILUXM6FnvlswgR2KcrUMeYdnRydrKGfGHt0KAJd
         VJGOSBZAC2WpYN2KwMQbc6ZPJjh4i+CPwHiTiVhGaWL/VpFdR9g1Sx/DTq3P4sJwry3B
         k6O4a9uXudPL0XMY4QZTEDcWP158c0ZnweCT4HpX6+eqDa0ZMXQNJgd2mg4aG3mC4Ogh
         vgvm7MrwjIvgRvBFQEZrDDyKkJ5D5NmKgaecfqIrX9bcYGG/UYCVBvbMiNnDJG5Kjy94
         duj9ww86UJl/jntOEOAe+3HTqSMmZ67utp38rNSsMvNk6y+qub/AB1P3Dczq3IeAn50i
         y91g==
X-Gm-Message-State: AOAM531zHzuABz2n73RZvm/l/5y8LhtT00CZd4hVJiywdiLnuVXnSjuB
	s9erBjmluAx5kBplWtKzXrH28ldYKS4YUdMxfGX4ruGbfmImZw==
X-Google-Smtp-Source: ABdhPJww2NCzwl1KudiLx73FHY1lRHxrsD8AWldBfQt/fvDpFo5NFD+6Oy1JBsM/t/Bqsh9k1za57LaolMmDeiSNgg8=
X-Received: by 2002:a05:6902:124c:: with SMTP id t12mr3115810ybu.656.1644300278348;
 Mon, 07 Feb 2022 22:04:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220207214026.1526151-1-pmalani@chromium.org>
 <20220207214026.1526151-3-pmalani@chromium.org> <YgIBIlnLPiV+49HI@google.com>
In-Reply-To: <YgIBIlnLPiV+49HI@google.com>
From: Prashant Malani <pmalani@chromium.org>
Date: Mon, 7 Feb 2022 22:04:27 -0800
Message-ID: <CACeCKacQP4OjfQ-x8VE66bnh1J28jsYjC3udjiHZN7hJrmDGsw@mail.gmail.com>
Subject: Re: [PATCH 2/4] platform/chrome: cros_ec_typec: Get mux state inside configure_mux
To: Tzung-Bi Shih <tzungbi@google.com>
Cc: linux-kernel@vger.kernel.org, Benson Leung <bleung@chromium.org>, 
	"open list:CHROMEOS EC USB TYPE-C DRIVER" <chrome-platform@lists.linux.dev>, Guenter Roeck <groeck@chromium.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 7, 2022 at 9:35 PM Tzung-Bi Shih <tzungbi@google.com> wrote:
>
> On Mon, Feb 07, 2022 at 09:40:26PM +0000, Prashant Malani wrote:
> > Move the function which gets current mux state inside the
> > cros_typec_configure_mux() function. It is better to group those
> > bits of functionality together, and it makes it easier to move around
> > cros_typec_configure_mux() later.
>
> nit: s/Move/Moves/.

Move is fine. Please see:
https://www.kernel.org/doc/html/v4.17/process/submitting-patches.html#describe-your-changes

Quoting from the above: " Describe your changes in imperative mood,"

>
> >  static int cros_typec_configure_mux(struct cros_typec_data *typec, int port_num,
> > -                             uint8_t mux_flags,
> >                               struct ec_response_usb_pd_control_v2 *pd_ctrl)
> >  {
> >       struct cros_typec_port *port = typec->ports[port_num];
> > +     struct ec_response_usb_pd_mux_info mux_resp;
> > +     struct ec_params_usb_pd_mux_info req = {
> > +             .port = port_num,
> > +     };
> >       struct ec_params_usb_pd_mux_ack mux_ack;
> >       enum typec_orientation orientation;
> >       int ret = 0;
> >
> > +     ret = cros_ec_command(typec->ec, 0, EC_CMD_USB_PD_MUX_INFO,
> > +                           &req, sizeof(req), &mux_resp, sizeof(mux_resp));
>
> It was `req` and `resp` in cros_typec_get_mux_info().  However, `mux_resp` for
> separating from `struct ec_response_usb_pd_control_v2 resp` in
> cros_typec_port_update().
>
> It would be neat to be either {`req`, `resp`} or {`mux_req`, `mux_resp`} in
> cros_typec_configure_mux().

I'll change it to resp (instead of mux_resp)
