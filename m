Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A929F2848BB
	for <chrome-platform@lists.linux.dev>; Tue,  3 Mar 2026 07:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772522272; cv=pass; b=FXbKRRs0iDwA//GujtlhMcNZrGCWzMDgbbp/m13G6UEe6wF/A7Rq2xaxlnGzBIxKCCD4MRT0VlH99y1LUSRDAIgkGOeoKNaGMZQQtv4tbnMFApkh04HmbfPyQxvNxmat5bhZ7zSxXLc541UXB/ZBHmWbYUD5hs+XdX+gEFM8Juw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772522272; c=relaxed/simple;
	bh=iUDuzbIHKAT4wzJ1ISMnYFQi+mWbHKpDMtu5nmVdaeg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rNX9yGCNloh6cZzhJYzhbD0D0jpDNpbDowYl6QPgyLp9AOq1sxMCR1tdzb9Lyo9t71kiTgNwTLcc9XwdiUQ8OImM631Wyaut0R4OzCd7fZKxfj9bwLuO9NxEX2JLe4/fAPboQ8dopAyK9a0Fv1bLXaWaJ5a/RsU8cDN69iCdJJY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=EY2sbBnl; arc=pass smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EY2sbBnl"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3599019ae92so938802a91.0
        for <chrome-platform@lists.linux.dev>; Mon, 02 Mar 2026 23:17:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772522270; cv=none;
        d=google.com; s=arc-20240605;
        b=jNHry5KxqQKzFHM5KANJyOUIqeUgN/yJJCLXIhw5OSCCuC4e6EWPGcIHbMSH3Qizz/
         5D2WE5K7qFqrVZUcZ0Y/EjJxA1pVmkyIw4vu0YLCkLCihKYPpVsCd4lrKocb+sr8uG5h
         tsQz3wEfk/4LMWX2Spiraj8gdrfJp2qg10TJS+xpyRb8J++yJCh+X2VQCr8fxpQl1W7q
         SKEq9IYl6yMb2MBNS10dqc6BjQiHa8tC5jWkyT2gAWHHKaYfN2obqw+QfNV2AEyfLOZY
         HSxSVb2X5pYiFnOlZGq/X/w+rF1CU0YgVqmoO0PLN61OiO53hjnaFAxNaW3t+G+0WlHi
         EV/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=a0QWWGNwU+W7+a0DVHWQRw0ADddDXvdL9npPJTEapD8=;
        fh=a5OzJ9+mmm4mUlWMOPGfFUkYX485WHHz5zzgWJhlBwE=;
        b=RKse6jjRTPHnmzV2FGf+tV2LKZA41+UQrDNel4ayr+h7BRsY5XlOIhWYJ3ICZFS/tG
         iHFH5Kmnbcv0XfZEtF27hTujxsR0gjaXP5LrGyAO28slH7FfLvluZTKXT3qXsglIDIfS
         nNrgyWso8E+ARfka2skNVl7q5HaQxB2XFT0KY21LAnZY1gt3g78rT84/YyFcRgo7ql5/
         pCSxBOiGniNmQZqjPNhWk6g3xtr+wAr37ahzcJjrkILACyLTYieH3AK2oBiPPVYz8v1D
         7uU0Gs261ZRZbl3HMaPn2sB9Oq7HT+kGoigLwwmJdU/SQlJvM+vzc5nBR9pCSd/4SY0l
         KTqg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1772522270; x=1773127070; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a0QWWGNwU+W7+a0DVHWQRw0ADddDXvdL9npPJTEapD8=;
        b=EY2sbBnlSDxi6KlizesdOIZfdEvQBWeku5D6viZ6PEciir0sfmogI5p3ykY6WGdKfY
         AN6RNOhENYiHraPZHAyj017BlyBmRaqh7kv5fb8smruYJqND2nFT0QAcHpVGmbVtucWl
         cYeEOi02ENMgT+iW5DyRNmEL5OKbrxDQ0xc/I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772522270; x=1773127070;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a0QWWGNwU+W7+a0DVHWQRw0ADddDXvdL9npPJTEapD8=;
        b=N7GZ/9og2p+016eOxzCaBKcVbwsmXQcofgNRqULAnp5NqkCl4N33pETDetQ09nQi74
         YUgNVio6TpzprvhZ37MlNExPZwUMl/hw+7JHvloFY8+HZ+/1D97G8TuJqEXcqJjG+3tN
         4EcQAaf4P+ehKKM28fqz2eQcIcNq3R7Cxkh1UZHI9cTt4uZSoAEx+667IEWv69v/8R7X
         GehuHS67E5cBAe5U3hWyTqpNular/ozCl1GDS+OBqWGPJOfO/iykL03HTzF0Vzr5zEnv
         l44BMwTfDrD9a64q6NXzYkrgXh7+q1QiBMhnE/b6kbSRFyRDHEHdoU5UUEimLobIL6ux
         HTNg==
X-Forwarded-Encrypted: i=1; AJvYcCXu/WJnfui8mPnNKy1riVdGdJtfYYpgIuXnsi4ixdfvKFWmTlfnX1EFH//mBh6EAj7+HchSfZZX2RZppb5JawA=@lists.linux.dev
X-Gm-Message-State: AOJu0YzIZDqtVJoX0noRnc8NmJOgR6emAvkov7Yn5EKSmVuqdKuRVItk
	R+mmwphUWRh3OVk9Uut+cTm9ilKFeIcgKvz3Vs9ABadbL/P2iiEZ+DD66xvK4BxGJbbW653QsYy
	OQfhYRb/9IxlKKZLLjxiWzpJpzwnU57Us611djnFj
X-Gm-Gg: ATEYQzzWTW1ObnR3FIDr5eTOan5C7lXIQML+f1UxJusbOacPYvgp12chwbGHKRLvAoN
	mcTpq9qTkOrjjJoR1T7IGuOdZhfdce8xhy7X1s6gJxusayi/gQ/GFB4ZVXqe/05N3Mpo2XvLTIz
	/7oBHd1OJdKMo7DZL7Lmi1pIGowT/uZIzXy/aYledNxk2G8hObjS8eoDY0zKHKr6ZmOiyf+tTZ7
	f739c6J5eO+uMGw0XshvFKWX0YkeGhIAsKoJ6bmSPZWxy/ch/Bw0fGaa8CB/mUvk7swwnR97HD7
	1GQGdl8EmHZNQbkarVua8SGaIkQwc1KyUg==
X-Received: by 2002:a17:90a:f950:b0:356:22ef:57ba with SMTP id
 98e67ed59e1d1-35965c17f28mr12019636a91.7.1772522270023; Mon, 02 Mar 2026
 23:17:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260205-smaug-type_c-v1-1-d6e556bf6640@tecnico.ulisboa.pt>
In-Reply-To: <20260205-smaug-type_c-v1-1-d6e556bf6640@tecnico.ulisboa.pt>
From: Andrei Kuchynski <akuchynski@chromium.org>
Date: Tue, 3 Mar 2026 08:17:38 +0100
X-Gm-Features: AaiRm53veFG4Ts4UFjJL5-8xajlIE3RC3p1oMVH2mF_ag7WRwvpeAzno9nUMyAk
Message-ID: <CAMMMRMf_Se9fbH50RSJvEfHCF6ds6TZfVzK4NJCs2UsViGAr1A@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: cros_ec_typec: Skip Type-C mux handling
 in EC-driven devices
To: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Cc: Benson Leung <bleung@chromium.org>, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Jameson Thies <jthies@google.com>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, Guenter Roeck <groeck@chromium.org>, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Diogo,

On Thu, Feb 5, 2026 at 11:04=E2=80=AFAM Diogo Ivo <diogo.ivo@tecnico.ulisbo=
a.pt> wrote:
>
> Currently the code assumes that the EC firmware will leave Type-C mux
> handling logic to the AP, exposing an interface to query and change the
> mux state via a request from the AP. However, in devices such as Smaug
> the EC automatically takes care of mux configuration and only USB role
> switching needs to be handled by the AP. In fact, in such devices this
> interface is not exposed by the EC making the whole process fail,
> including role switching.
>
> Fix this by first separating Type-C mux handling and USB role switching,
> explicitly querying the behaviour of the EC and execute each part
> conditionally according to what the EC reported.
>
> Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
> ---
>  drivers/platform/chrome/cros_ec_typec.c | 49 +++++++++++++++++++++++----=
------
>  drivers/platform/chrome/cros_ec_typec.h |  2 +-
>  2 files changed, 35 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/c=
hrome/cros_ec_typec.c
> index b712bcff6fb2..bd7e6c365cab 100644
> --- a/drivers/platform/chrome/cros_ec_typec.c
> +++ b/drivers/platform/chrome/cros_ec_typec.c
> @@ -751,11 +751,10 @@ static int cros_typec_configure_mux(struct cros_typ=
ec_data *typec, int port_num,
>         }
>
>         /* No change needs to be made, let's exit early. */
> -       if (port->mux_flags =3D=3D resp.flags && port->role =3D=3D pd_ctr=
l->role)
> +       if (port->mux_flags =3D=3D resp.flags)
>                 return 0;
>
>         port->mux_flags =3D resp.flags;
> -       port->role =3D pd_ctrl->role;
>
>         if (port->mux_flags =3D=3D USB_PD_MUX_NONE) {
>                 ret =3D cros_typec_usb_disconnect_state(port);
> @@ -771,12 +770,6 @@ static int cros_typec_configure_mux(struct cros_type=
c_data *typec, int port_num,
>         if (ret)
>                 return ret;
>
> -       ret =3D usb_role_switch_set_role(typec->ports[port_num]->role_sw,
> -                                       pd_ctrl->role & PD_CTRL_RESP_ROLE=
_DATA
> -                                       ? USB_ROLE_HOST : USB_ROLE_DEVICE=
);
> -       if (ret)
> -               return ret;
> -
>         if (port->mux_flags & USB_PD_MUX_USB4_ENABLED) {
>                 ret =3D cros_typec_enable_usb4(typec, port_num, pd_ctrl);
>         } else if (port->mux_flags & USB_PD_MUX_TBT_COMPAT_ENABLED) {
> @@ -822,6 +815,25 @@ static int cros_typec_configure_mux(struct cros_type=
c_data *typec, int port_num,
>         return ret;
>  }
>
> +static int cros_typec_set_role(struct cros_typec_data *typec, int port_n=
um,
> +                              struct ec_response_usb_pd_control_v1 *resp=
)
> +{
> +       enum usb_role cur_role =3D usb_role_switch_get_role(typec->ports[=
port_num]->role_sw);
> +       enum usb_role role =3D resp->role & PD_CTRL_RESP_ROLE_DATA ? USB_=
ROLE_HOST :
> +                                                                  USB_RO=
LE_DEVICE;
> +       bool connected =3D resp->enabled & PD_CTRL_RESP_ENABLED_CONNECTED=
;
> +       int ret;
> +
> +       if (!connected || cur_role =3D=3D role)
> +               return 0;
> +
> +       ret =3D usb_role_switch_set_role(typec->ports[port_num]->role_sw,=
 role);
> +       if (ret)
> +               dev_err(typec->dev, "Failed USB role switch, err =3D %d\n=
", ret);

While testing on Brya, I've got a role switch failure:
cros-ec-typec GOOG0014:00: Failed USB role switch, err =3D -22
cros-ec-typec GOOG0014:00: Update failed for port: 1

Steps to reproduce: deactivate any alt-mode.
Verified on the Brya platform.

This may be attributed to the altered sequence of mux and switch settings.


Thanks,
Andrei
