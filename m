Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A58912F27
	for <chrome-platform@lists.linux.dev>; Tue,  8 Feb 2022 18:36:02 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id p5so52345228ybd.13
        for <chrome-platform@lists.linux.dev>; Tue, 08 Feb 2022 10:36:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pDmLr/WH4FLQYo7uIWonS/i0PmeMzo/Pev7kejp0k1o=;
        b=VFCL/HXQNvhZjG63aCHcAqcjIwCyWul6j2HT2Bk+0pQmyc/0cwvHrMOtSDmYgFFzZq
         Yco11MCTQAldPNWZuj7f61KDVkZDGDQFPwQgtJpDdY/6nW5FRJ/QHtjSTPwZpGdqqDvg
         PHheRDWIw8PJuTK3uC78637GA5hoeomxWvCbc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pDmLr/WH4FLQYo7uIWonS/i0PmeMzo/Pev7kejp0k1o=;
        b=6pWGC5y5IuKE21lLamjSqD1eLgijgUUlbH9djBNO9RqQ4ZsAJz/y6fEF+yK6//1nIg
         C5j20bVJY37DLx32wJ7Dz1GMYmu7yqxCjO9JCQS+3kWtHFvMGk8ASRICjeEDr9G2XJMu
         r8qa/FlAYXNjjwrl2bLFOEVEVv6g/C4VlrHYdaAJrTKpIUAjAplYhsAlxM5lVTZ/Vt9j
         Mm4VBPEuIvUgCsjn+fsDGJJEu8lpHanRdl/pX+KNPw8RMxgglwXZkSwMJs8AyxqZL/X/
         cS2mscnsAi7kBEupourKYqO5gpR3VxQL8o3b2gODPw3zXkhjs3OgdC/Uq1eJ/Epe5t6i
         vZpg==
X-Gm-Message-State: AOAM530T4fKtx+aQZfydGUpnIBfrD4VcU3SYKM3X1xppvxfvvbGbau3r
	tBhe+XzNLWV4SokyZV84/4N2v1sxDPUI3gJyL2Sh6A==
X-Google-Smtp-Source: ABdhPJyIHn0+YOlJrsi9sknHgah7dESwjIxnnUx8QH7v97ifugGT1o/JZcYEBXykjrulOYO+1EEAJAg3i9SqGXp4ZCc=
X-Received: by 2002:a05:6902:124c:: with SMTP id t12mr5802260ybu.656.1644345361190;
 Tue, 08 Feb 2022 10:36:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220207214026.1526151-1-pmalani@chromium.org>
 <20220207214026.1526151-4-pmalani@chromium.org> <YgIBv2SQdwXm7RLt@google.com>
 <CACeCKaezRNgsqrq3QJ1ViHjYScFrjpC-kCaYmE8kOXCcW9MRrw@mail.gmail.com> <YgJQ30D8nc4LWvUy@google.com>
In-Reply-To: <YgJQ30D8nc4LWvUy@google.com>
From: Prashant Malani <pmalani@chromium.org>
Date: Tue, 8 Feb 2022 10:35:50 -0800
Message-ID: <CACeCKaf4+jxSkKFqx9g3YSPWj-FkbL=jrmHE3YEu7oU0ySPJ4Q@mail.gmail.com>
Subject: Re: [PATCH 3/4] platform/chrome: cros_ec_typec: Configure muxes at
 start of port update
To: Tzung-Bi Shih <tzungbi@google.com>
Cc: linux-kernel@vger.kernel.org, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, 
	"open list:CHROMEOS EC USB TYPE-C DRIVER" <chrome-platform@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 8, 2022 at 3:15 AM Tzung-Bi Shih <tzungbi@google.com> wrote:
>
> On Mon, Feb 07, 2022 at 10:12:10PM -0800, Prashant Malani wrote:
> > On Mon, Feb 7, 2022 at 9:38 PM Tzung-Bi Shih <tzungbi@google.com> wrote:
> > > On Mon, Feb 07, 2022 at 09:40:28PM +0000, Prashant Malani wrote:
> > > > There are situations where the mux state reported by the Embedded
> > > > Controller (EC), might lag the partner "connected" state. So, the mux
> > > > state might still suggest that a partner is connected, while the PD
> > > > "connected" state, being in Try.SNK (for example) suggests that the
> > > > partner is disconnected.
> > > >
> > > > In such a scenario, we will end up sending a disconnect command to the
> > > > mux driver, followed by a connect command, since the mux is configured
> > > > later. Avoid this by configuring the mux before
> > > > registering/disconnecting a partner.
> > >
> > > I failed to understand the description.  It looks like some protocol details.
> > > Could you provide some brief explanation in the commit message?
> >
> > I'm not sure how else I can better elaborate on this in the commit message than
> > as currently stated.
> > Since the EC is an independent controller, the mux state *can* lag the
> > "connected" state.
> > So, as described in the commit message, when a disconnect happens, we could have
> > a disconnect (since PD_CTRL contains the "connected state") followed
> > by a configure_mux
> > with the mux state still suggesting a connected device (the drivers
> > which implement the
> > mux/switch controls can misconstrue the old mux state) which results
> > in a connect. This
> > patch eliminates that.
>
> Pardon me if I ask, I am trying to understand why reorder the function calls
> in cros_typec_port_update() can fix the issue.  And I am wondering if the
> issue has fixed by the 4th patch in the series.

It's not completely fixed by that; that is just an outstanding missing
state update.
If we just use just that patch, configure_mux() will still be executed
before the code in patch 4 runs.

>
> To make sure I understand the issue correctly, imaging a "disconnect" event
> in cros_typec_port_update() originally:
>
> a. Get pd_ctrl via EC_CMD_USB_PD_CONTROL[1].
>
> b. Call cros_typec_remove_partner() in cros_typec_set_port_params_v1()[2].
> Is it the "disconnect" you were referring in the example?
>
> c. Get mux info via EC_CMD_USB_PD_MUX_INFO.
> Did you mean the mux info might be stale which is "partner connected"?

Yes, it can.

>
> d. Call cros_typec_enable_dp() in cros_typec_configure_mux()[3].
> Does it result in another connect?

It can occur much earlier, depending on what the mux state is (example: [1])

>
> [1]: https://elixir.bootlin.com/linux/v5.17-rc3/source/drivers/platform/chrome/cros_ec_typec.c#L955
> [2]: https://elixir.bootlin.com/linux/v5.17-rc3/source/drivers/platform/chrome/cros_ec_typec.c#L628
> [3]: https://elixir.bootlin.com/linux/v5.17-rc3/source/drivers/platform/chrome/cros_ec_typec.c#L548
>
> If the above understanding is correct, the patch fixes it by moving step b to
> the last.  As a result, it won't have a "disconnect" -> "connect" transition.

Yes
>
> Further questions:
>
> - If mux info from step c would be stale, won't it exit earlier in [4]?
>
> [4]: https://elixir.bootlin.com/linux/v5.17-rc3/source/drivers/platform/chrome/cros_ec_typec.c#L986
>
> - The 4th patch[5] sets mux_flags to USB_PD_MUX_NONE.  If it won't exit earlier
>   from previous question, won't it fall into [6]?

No. it depends on the mux flags and the pd_ctrl response.

>
> [5]: https://patchwork.kernel.org/project/chrome-platform/patch/20220207214026.1526151-5-pmalani@chromium.org/
> [6]: https://elixir.bootlin.com/linux/v5.17-rc3/source/drivers/platform/chrome/cros_ec_typec.c#L523

This link [6] points to cros_typec_enable_usb4(); it's doesn't relate
to your statement above.

>
> > > > @@ -965,6 +965,11 @@ static int cros_typec_port_update(struct cros_typec_data *typec, int port_num)
> > > >       if (ret < 0)
> > > >               return ret;
> > > >
> > > > +     /* Update the switches if they exist, according to requested state */
> > > > +     ret = cros_typec_configure_mux(typec, port_num, &resp);
> > > > +     if (ret)
> > > > +             dev_warn(typec->dev, "Configure muxes failed, err = %d\n", ret);
> > >
> > > It used the fact that the function returns `ret` at the end.  After the move,
> > > the block is no longer the last thing before function returns.
> > >
> > > Does it make more sense to return earlier if cros_typec_configure_mux() fails?
> > > Does the rest of code need to be executed even if cros_typec_configure_mux()
> > > fails?
> >
> > Yes, it should still be executed (we still need to update the port
> > state). That is why the return is eliminated.
>
> Got it, as long as it is intended.
>
> > > > @@ -980,11 +985,6 @@ static int cros_typec_port_update(struct cros_typec_data *typec, int port_num)
> > > >       if (typec->typec_cmd_supported)
> > > >               cros_typec_handle_status(typec, port_num);
> > > >
> > > > -     /* Update the switches if they exist, according to requested state */
> > > > -     ret = cros_typec_configure_mux(typec, port_num, &resp);
> > > > -     if (ret)
> > > > -             dev_warn(typec->dev, "Configure muxes failed, err = %d\n", ret);
> > > > -
> > > >       return ret;
> > >
> > > If the function decides to return earlier, it can be `return 0;`.
> > Sure, I can change this in the next version
>
> No, I guess you would like to leave it as is to propagate return value from
> cros_typec_configure_mux().

No, it is better to not propogate that return value (we're doing it
earlier, but there isn't
anything the caller can do about it). We should just print a warn and
still update the port
state (userspace still reads the port state).

In general, I think you may benefit from reading:
- The entire cros_ec_typec driver
- The EC Type C state machine [2] and interfaces [3][4]

The above 2 will help understand how this entire stack works. Without
it, it is challenging
to process the flow (just from code review).

If you have further questions our would like to better understand the
drivers, feel free to reach
out to me over IM/email. I don't think public list code review is the
best option for this
sort of explanation.

[1] https://elixir.bootlin.com/linux/latest/source/drivers/platform/chrome/cros_ec_typec.c#L549
[2] https://source.chromium.org/chromiumos/chromiumos/codesearch/+/main:src/platform/ec/common/usbc/
[3] https://source.chromium.org/chromiumos/chromiumos/codesearch/+/main:src/platform/ec/driver/usb_mux/usb_mux.c
[4] https://source.chromium.org/chromiumos/chromiumos/codesearch/+/main:src/platform/ec/common/usb_pd_host_cmd.c
