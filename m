Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 559E63A1CE7
	for <chrome-platform@lists.linux.dev>; Wed,  4 Mar 2026 10:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772620255; cv=pass; b=tasfUv+4V6tDCd1+QhoEtReTFws5+aATkPpIyNce+kLc1pp/JKus8KQs7ObwOZgzlA2BuYcYMlwjfPwTi8N0nY4ztULB92o0RBICS1ZaVxGO3qLfguqRybJ3EMXOtfVUPa/WxYyeX0dxu7jEQcpdhPkmRMlOc3NjKWMKLJTXnyA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772620255; c=relaxed/simple;
	bh=PfY+ZhtZaCzSTOaIOf1aQqM8+YHJuq1j7pcxrg9EBsE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OQmvvUk2V0n+lZKhUmA6fiCk+SPDja0SiNhiLYllWd220+nlF7UwvWyDuCvXx0P1RZwgQK7grYXWDDpK1lhU6kT1Wv9NDl9c7DHtz1UlviCpyzmemZIu8tDPQtE6zW2aB7wCwL9UvN23f6zkQpMuOeHpa84Anwfopv6BkB6bPDc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bjzQP5EB; arc=pass smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bjzQP5EB"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c6e77ace76aso2530901a12.3
        for <chrome-platform@lists.linux.dev>; Wed, 04 Mar 2026 02:30:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772620253; cv=none;
        d=google.com; s=arc-20240605;
        b=elbGXmCxQarLrJqrMH21vd1UR6X0PIjSsrzT1aIjAHp7nvA6hjbukfhbN1iqD4b7Xh
         qikzle03T3+bJk0/q8mTWfSD3hjqlLoHYDk1angIGJA0bW42Gt9K2l1vRafF678fCB4N
         wRJ3kx2Qk5jzBY44Fg0G3VdK8hj77aLUDfVksCKTHRTYrfaTekGocr3iLgPtuX2e2ijx
         kxFtiNeXS3PUwaH42YDzkgg+LGFiPojq3ej4Wl5n40yOa91NI07A5uAEH1XecNMXRQO8
         Ta1UlDkYFaxRCzxaFHha7poEj9a3V9cTVt+9ChbYR6q7DSG5I7IfVmP8yDdIuj/K5LyJ
         SR7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ul8EZRPh/FawI3SZV0nh3RJElBsdTFY32QjIJzSaI7c=;
        fh=nNu2rvTf1lqzJEoBpixObHMLjo9JKf7sUw8J670WBiY=;
        b=bBU6Qf67/VUhQxNSzqmQ1vY8o6rNFrzy/hw278j13+7FUhza5D+d0KaamwVahJo4U7
         5PmySqB+/30UVCHT65W71Dp9nM2ksm4LxLVpZFhL7oLN0oD8n95/1VMnxvCuDxJHnDFJ
         9WowqQ/uLQEYW6M25FMg4S/1373CH087d6xJSY9iZXDbQTl23VStSF0Yq7hQWRJLyT3t
         ODAqH/qTrJr80XpDKiFwomqSEviCdBugt0a/iKqgxTaZYev4SviUpfTRtvFkfdxBCyVB
         VT5sO3nmvBhQZwnZ3REs69F+1BQTT48PnjnXgyuMJ+B/iPaEZjlZ+Ib70jn+C2s9ZUy2
         NI9Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1772620253; x=1773225053; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ul8EZRPh/FawI3SZV0nh3RJElBsdTFY32QjIJzSaI7c=;
        b=bjzQP5EB8L+sY4jBFrdnXCFo0U0vZH8a1WOIivv2Gz6tkNIaD8/KajFmmugdNRLFBC
         3aPoVhWzt+n6RcZKE5Alas3PQHRo5UbIoA1id6L3OoWRWg6CGk/xFEotviKpCegabDGQ
         AdmFB0aaNt8zdQ9sGBM4K/YBtXyrsVrc4vkA4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772620253; x=1773225053;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ul8EZRPh/FawI3SZV0nh3RJElBsdTFY32QjIJzSaI7c=;
        b=mVI+aUW4W/JB9MK9k+OkLj+6HGjQ6PEweixcfT4kwcz0Au+hPDc7CyabMi03k475WQ
         eiBPnbc2I007MEz3LfW1v0Aj7hacWQFyvyZW2lo3VMbW39LUqHgSHKPdSS0/qMUq63Ao
         DVGdpAWkw4VCS4UfI4z6IYh/nr6KMAgB4T4NqM5G9EzKqZrvHcH80ZjBoGwW2lweZW9u
         v6vmf9/75rbJ6Lgc7u7CGu7Q3wJHcFivHk+hjfPKtGPhf7GwICus4SyvAyLHLs9//Ary
         rf3ELytds+ZemYchemBZPU6Oq6gSoT/4kL3sTlCyej6uCuL7isZKjzHVSvtAK6ZPrDuR
         +M/w==
X-Forwarded-Encrypted: i=1; AJvYcCWF4X5Rrjjnc47eteakBLTKty0gFMZwuSRrN2Qp823UMYRKeEzHNkHajCna7CbhlGuLgBGNf2IjJGIU2J2iVMg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyj42iQb3B+fiZaOBVrNhzBY/PH36CF0hfzHN18k3qgzbo5F2Gp
	cIwyZs1tH/6LnMfssSifcDk8TRnEEwsVxt8qWVm1AV5nBgrqbd2ZunUkvigBaStG5wx2/MK1yWu
	DJskvMd1rRbPyYqK7pjEoMGjo4KFjuxqjtexKWpSk
X-Gm-Gg: ATEYQzzLhxVfrI5++FwOoiax/UlIoH0urrElCTGXCR3h/CRiPrzWAMAsSO8MbC0URaV
	yc3Lp+Ti2UZIRWqEUdoE7UisKKO3Ptncki3gjwP7lJbXV9MdjIna9XaHi/L3L3ElazSVzzfjdcq
	VqJIwIS79pJrybjA5aJ9ht+jt1gVS4ziHk+ZN7AtUwquQFMBtmJI/QQXFAOkt3OP5JMtzTGfOsx
	ejXru4wN8TH0/Fa2v+HYg5gYSwRTTdHmYnVHZn8KytURJMu1WG4Ry2iDhjCuaYB0a9Ex2YM9XMx
	GS/bx1nkzErmG/jMsbXUMD3HmMvl4DpREg==
X-Received: by 2002:a17:90b:2888:b0:359:7906:d996 with SMTP id
 98e67ed59e1d1-359a6a66a94mr1612977a91.23.1772620252752; Wed, 04 Mar 2026
 02:30:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260205-smaug-type_c-v1-1-d6e556bf6640@tecnico.ulisboa.pt>
 <CAMMMRMf_Se9fbH50RSJvEfHCF6ds6TZfVzK4NJCs2UsViGAr1A@mail.gmail.com> <cef799c2-1612-4e28-bae5-ab33cd9c3aa8@tecnico.ulisboa.pt>
In-Reply-To: <cef799c2-1612-4e28-bae5-ab33cd9c3aa8@tecnico.ulisboa.pt>
From: Andrei Kuchynski <akuchynski@chromium.org>
Date: Wed, 4 Mar 2026 11:30:40 +0100
X-Gm-Features: AaiRm50lN_5aPITKd6-dE8gL6Ip_Tp1GKuH8-CQe_b3dolSkbVgUSni6zF6PS3w
Message-ID: <CAMMMRMe0Od7jJ+nJdRn_P+gU-8aaFd4K-g-UKz2j43wNiqE-MA@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: cros_ec_typec: Skip Type-C mux handling
 in EC-driven devices
To: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Cc: Benson Leung <bleung@chromium.org>, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Jameson Thies <jthies@google.com>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, Guenter Roeck <groeck@chromium.org>, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 3, 2026 at 10:54=E2=80=AFAM Diogo Ivo <diogo.ivo@tecnico.ulisbo=
a.pt> wrote:
>
> Hi Andrei, thanks for testing.
>
> On 3/3/26 07:17, Andrei Kuchynski wrote:
> > Hi Diogo,
> >
> > On Thu, Feb 5, 2026 at 11:04=E2=80=AFAM Diogo Ivo <diogo.ivo@tecnico.ul=
isboa.pt> wrote:
> >>
> >> Currently the code assumes that the EC firmware will leave Type-C mux
> >> handling logic to the AP, exposing an interface to query and change th=
e
> >> mux state via a request from the AP. However, in devices such as Smaug
> >> the EC automatically takes care of mux configuration and only USB role
> >> switching needs to be handled by the AP. In fact, in such devices this
> >> interface is not exposed by the EC making the whole process fail,
> >> including role switching.
> >>
> >> Fix this by first separating Type-C mux handling and USB role switchin=
g,
> >> explicitly querying the behaviour of the EC and execute each part
> >> conditionally according to what the EC reported.
> >>
> >> Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
> >> ---
> >>   drivers/platform/chrome/cros_ec_typec.c | 49 +++++++++++++++++++++++=
----------
> >>   drivers/platform/chrome/cros_ec_typec.h |  2 +-
> >>   2 files changed, 35 insertions(+), 16 deletions(-)
> >>
> >> diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platfor=
m/chrome/cros_ec_typec.c
> >> index b712bcff6fb2..bd7e6c365cab 100644
> >> --- a/drivers/platform/chrome/cros_ec_typec.c
> >> +++ b/drivers/platform/chrome/cros_ec_typec.c
> >> @@ -751,11 +751,10 @@ static int cros_typec_configure_mux(struct cros_=
typec_data *typec, int port_num,
> >>          }
> >>
> >>          /* No change needs to be made, let's exit early. */
> >> -       if (port->mux_flags =3D=3D resp.flags && port->role =3D=3D pd_=
ctrl->role)
> >> +       if (port->mux_flags =3D=3D resp.flags)
> >>                  return 0;
> >>
> >>          port->mux_flags =3D resp.flags;
> >> -       port->role =3D pd_ctrl->role;
> >>
> >>          if (port->mux_flags =3D=3D USB_PD_MUX_NONE) {
> >>                  ret =3D cros_typec_usb_disconnect_state(port);
> >> @@ -771,12 +770,6 @@ static int cros_typec_configure_mux(struct cros_t=
ypec_data *typec, int port_num,
> >>          if (ret)
> >>                  return ret;
> >>
> >> -       ret =3D usb_role_switch_set_role(typec->ports[port_num]->role_=
sw,
> >> -                                       pd_ctrl->role & PD_CTRL_RESP_R=
OLE_DATA
> >> -                                       ? USB_ROLE_HOST : USB_ROLE_DEV=
ICE);
> >> -       if (ret)
> >> -               return ret;
> >> -
> >>          if (port->mux_flags & USB_PD_MUX_USB4_ENABLED) {
> >>                  ret =3D cros_typec_enable_usb4(typec, port_num, pd_ct=
rl);
> >>          } else if (port->mux_flags & USB_PD_MUX_TBT_COMPAT_ENABLED) {
> >> @@ -822,6 +815,25 @@ static int cros_typec_configure_mux(struct cros_t=
ypec_data *typec, int port_num,
> >>          return ret;
> >>   }
> >>
> >> +static int cros_typec_set_role(struct cros_typec_data *typec, int por=
t_num,
> >> +                              struct ec_response_usb_pd_control_v1 *r=
esp)
> >> +{
> >> +       enum usb_role cur_role =3D usb_role_switch_get_role(typec->por=
ts[port_num]->role_sw);
> >> +       enum usb_role role =3D resp->role & PD_CTRL_RESP_ROLE_DATA ? U=
SB_ROLE_HOST :
> >> +                                                                  USB=
_ROLE_DEVICE;
> >> +       bool connected =3D resp->enabled & PD_CTRL_RESP_ENABLED_CONNEC=
TED;
> >> +       int ret;
> >> +
> >> +       if (!connected || cur_role =3D=3D role)
> >> +               return 0;
> >> +
> >> +       ret =3D usb_role_switch_set_role(typec->ports[port_num]->role_=
sw, role);
> >> +       if (ret)
> >> +               dev_err(typec->dev, "Failed USB role switch, err =3D %=
d\n", ret);
> >
> > While testing on Brya, I've got a role switch failure:
> > cros-ec-typec GOOG0014:00: Failed USB role switch, err =3D -22
> > cros-ec-typec GOOG0014:00: Update failed for port: 1
> >
> > Steps to reproduce: deactivate any alt-mode.
>
> I'm unsure of what you mean by this, could you clarify?
>

The cros_ec_typec driver supports DisplayPort and Thunderbolt alternate
modes. During altmode activation or deactivation, the driver handles
Embedded Controller (EC) events via the cros_typec_port_update.

The `active` sysfs attribute is used to initiate these processes; writing 0
to `active` will exit DP or TBT alternate mode.

Thanks,
Andrei
