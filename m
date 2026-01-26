Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C35873033E5
	for <chrome-platform@lists.linux.dev>; Mon, 26 Jan 2026 08:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769417668; cv=pass; b=U5MO/e3Ga5M8nWN/mRuPENLeAGwSy40a9uzTACFyrfQDkPLYnkNBXL21N33n55x0ZFXobpfy5seOlE6QAJGHo0vrXeMVwv0k1oisxUdIyQI0FJcGPFhnjVUcMOHBaC8FLh0Ae+dOL3HWZNn1NLBZHUJaXd+s8+AbIhDR6QoHIPk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769417668; c=relaxed/simple;
	bh=Mn6UovrmmVTUUMbaXR1pJ+j/d7kMMKrkuXF5yRy7cRA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JRYjbuTDhHzcek0kW7s4cnh0AS2IhXcHMojj4cvBz4RFs8Eqywin3TOhXZxrc1hsRZG5Ef+KztTAVxmuFpsMc68Lstbx1GwWxn4mG7Wb6U7v7omGvLpNL3+8CgMauadfLDzpwgR1UADW1Hiyi8lavnMw7lfnAJOA+IUljrc7fvk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LPnZnNLV; arc=pass smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LPnZnNLV"
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-9412cb281acso1173616241.2
        for <chrome-platform@lists.linux.dev>; Mon, 26 Jan 2026 00:54:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769417666; cv=none;
        d=google.com; s=arc-20240605;
        b=lduAiwV4xQfTB3tT9vu7Tf7mjyLSq+KcvOeUMpg19fOFreQ5Z0BsM1L+NGRkbRczev
         R6RrBhRbDKX3DFIC9IuvUbNqFPi0CEIUiAV/8t+bYn9DElyimGh8tR9xAYWqgMODPYub
         mxbt9+bmaeOEPHHd8t6s4uTaqTm3iwzo1gnjPvgwqBggEilBzclQitSrQGA2UQEELHar
         no1E1QVQ3POoefvt5Jqo2o/SVaYSZWkCIO23bZl9+CKpprzVD6SB/ec4HDkNrLNQ1SiU
         Cu90hCmI01iV2ojA/qXtNUKxybbs4WLsKSDVGwcXC2aV8R1f8Q/4p7GsdbgareXgON/E
         /L/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DPEZBIQltoC5ZVe3EqLnMVrMVwdusXPC8mlasvrHl/s=;
        fh=2cLL11UgDWd3NS9wAm1dMfOBBQqQLZb8/LzTk+jq55I=;
        b=hl4+23WMiFEdmy8LgA0aE5Py0Mb7gyXsPp9rip00XQj+mYy55GWFUeHPGphs1cQjzO
         E2l2LJ6Ltbak2n8scodMLzo7MQ2ZmDu/Od46wse7qSUrI+R0ERIPMC5ORpZogGp3M8f+
         I31ISakKfqm6ucZoKvNuPj7uDjWDfu4bpneWEwZc/7s8qqtzyNl+hEyJxZx3fV8k85jf
         CGtQdpp7trxUCTPuZXRHacIBVc2E6/3IPv79s1iZlDaQ8sfTTp5ECNoGHQKAk42g3WGx
         6hyQjxTnjj/PGv4bmH/WId8uq0NnvW9S6aYodqjeTHWHSeYpFFs382oh4WZrq6RsAPuL
         ewCQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769417666; x=1770022466; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DPEZBIQltoC5ZVe3EqLnMVrMVwdusXPC8mlasvrHl/s=;
        b=LPnZnNLVoEjm+fVHEVTz9Nl/UEdAVERbMxFjN1G57LmEEFQljZt+N37Pzf6wDAVTRa
         9Lq2Q7x9aC6xjBr62swJxi+bA2MJ8Rr+lPUXLAfUMNU/v+qfzDfDc1A1YY+tghHLu7H4
         qa0QgPum8GtviUUkCwufB39qtdkWPSmsoRyJmQTxrBihbjEA0qF+uAz5FhcnETe8LjLZ
         hNtNK1bgwmd0RDKWCeZKZbTjJ8LaBWkDN+1+N98T611/QohpFJ5ZbNwa6VbpJXuYuSlT
         yP8795Gnwz4k3pAtr3D39pi8pCVkMB40jd75PVSpSZglF49T4EYLXq9giTWiMttwRpG8
         Ci9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769417666; x=1770022466;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DPEZBIQltoC5ZVe3EqLnMVrMVwdusXPC8mlasvrHl/s=;
        b=CD/JG3Dyj6F5hW40QvaXxDIikKPzwD9NyNciA6De61O2ajdwV46722u+gaNX/b+zkJ
         wiKEoXDo1MYw6eVv/5xoWzI1XU1ztHjiq23F0jkJoYxghlp1p1wcU+qDicHxGKtwcVZC
         Vyp2N+rCsMMaLhKDBOr3zhv4JXlySHvJwod/dkXnNUb+2XWnjGCRbVAN+j+o6eNJsAyp
         ddv/6JG6S9EZmCleR4eOfFclLADcTY1ff/AB3EOvLoxJ48utFm1USejuc+BVmPTsoKAS
         z/XTZqPtzCcGzqfUHfHlouZbFwcLPz7/TjSdafCoXZ3cuuO2A5NpTgmOWrs8AWTty2ad
         FlGA==
X-Forwarded-Encrypted: i=1; AJvYcCVtS9WOIS5NUoHB8r8AULc8FjXhAFD4mVuAcCGi8+xKGadgovI2kG2ztDO8k/WKC/UVo22T3MBOg4pwfqwbfdo=@lists.linux.dev
X-Gm-Message-State: AOJu0YwjeFYTCZdYmFHn7lWVSk1GVBRX6jN9BPXvPocJ/E7MJWfaWmO0
	hql+yvut3n1finrjRInDnqqhI0JYeJrsDB7VVn1BRitoYHRMmviRjjQr53uwxBcn3/N8u3dYolm
	fQ7Z4fKgE8WkGzi+ExxhyOrV/DJxPnBpXsZOhCNLx
X-Gm-Gg: AZuq6aJ/UGJYTKi88qw0krW3CXur8iWhi5bxT3WOWfPgUd0LHAUw6PGnCmzQufvRA3M
	7iIQf7p6Uu2zVirrjR23wCODgq+R+ODobUuCST+6MQnpXNTl1YxL56yK1vQn/f6v1Bh2v/MHmKd
	bKMB4pCWos9Irt6lMS+9O2IxlGJ45buU7dmpvvlFRD/yx42z5sfqxkBNQlUaoLPv8+97EZHi6bo
	ql4EVpfGQTFi3nFmTbRMBCE7owtvJcmGgtMZ/SJLeb/1GiCqAJr++pIpOvUSwvmO5d19W0eLVdu
	x/TzgpKUOgCKjxXbK7HS7g7su75s
X-Received: by 2002:a05:6102:b10:b0:5dd:84f1:b51a with SMTP id
 ada2fe7eead31-5f5765a058cmr916499137.43.1769417665468; Mon, 26 Jan 2026
 00:54:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260124085856.826357-1-gwendal@google.com> <aXcUMXt0kN9W26PV@google.com>
In-Reply-To: <aXcUMXt0kN9W26PV@google.com>
From: Gwendal Grignou <gwendal@google.com>
Date: Mon, 26 Jan 2026 00:54:13 -0800
X-Gm-Features: AZwV_Qgbo0dyl_Mh1-JriEiMz0Xs9uuUMBMJMnfYOZn7HfTyROKQsPbQyZ6vp1c
Message-ID: <CAMHSBOUywX9910toMukrE4znXz5xH6fF4w9Eq1vRZb5BPFzEeg@mail.gmail.com>
Subject: Re: [PATCH 1/2] chrome: lightbar: Report number of segments
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Gwendal Grignou <gwendal@chromium.org>, chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 25, 2026 at 11:13=E2=80=AFPM Tzung-Bi Shih <tzungbi@kernel.org>=
 wrote:
>
> On Sat, Jan 24, 2026 at 12:58:55AM -0800, Gwendal Grignou wrote:
> > Add attribue `num_segments` to return the number of exposed LED segment=
s
> > in the lightbar. It can be smaller than the number of physical leds in
> > the lightbar.
> >
> > Test: Check the attribute is present and returns a value when read.
>
> Please use "platform/chrome" prefix for the commit title.
Done (in v2).
>
> > +static ssize_t num_segments_show(struct device *dev,
> > +                              struct device_attribute *attr, char *buf=
)
> > +{
> > +     uint32_t num =3D 0;
>
> `./scripts/checkpatch.pl --strict`:
> CHECK: Prefer kernel type 'u32' over 'uint32_t'
I kept `uint...` to be consistent with the rest of the code.
>
> > +     struct cros_ec_dev *ec =3D to_cros_ec_dev(dev);
> > +     int ret;
> > +
> > +     ret =3D lb_throttle();
> > +     if (ret)
> > +             return ret;
> > +
> > +     struct ec_params_lightbar *param;
> > +     struct ec_response_lightbar *resp;
> > +     struct cros_ec_command *msg;
>
> For clarity, I prefer to move the 3 declarations before calling lb_thrott=
le()
> in the case.
Done
>
> > +
> > +     msg =3D alloc_lightbar_cmd_msg(ec);
> > +     if (!msg)
> > +             return -ENOMEM;
> > +
> > +     param =3D (struct ec_params_lightbar *)msg->data;
> > +     param->cmd =3D LIGHTBAR_CMD_GET_PARAMS_V3;
> > +     msg->outsize =3D sizeof(param->cmd);
> > +     msg->result =3D sizeof(resp->get_params_v3);
>              ^^^^^^ insize
>
> > +     ret =3D cros_ec_cmd_xfer_status(ec->ec_dev, msg);
> > +     if (ret < 0 && ret !=3D -EINVAL)
> > +             goto exit;
> > +
> > +     if (msg->result =3D=3D EC_RES_SUCCESS) {
> > +             resp =3D (struct ec_response_lightbar *)msg->data;
> > +             num =3D resp->get_params_v3.reported_led_num;
> > +     }
> > +
> > +     /*
> > +      * Anything else (ie, EC_RES_INVALID_COMMAND) - no direct control=
 over
> > +      * LEDs, return that no leds are supported.
> > +      */
> > +     ret =3D 0;
> > +exit:
> > +     kfree(msg);
> > +     if (ret)
> > +             return ret;
> > +     return sysfs_emit(buf, "%d\n", num);
>                                  ^ `num` is an u32.
> > +}
>
> How about:
>
>       ret =3D sysfs_emit(buf, "%u\n", num);
>   exit:
>       kfree(msg);
>       return ret;
Done.
>
>
> > diff --git a/include/linux/platform_data/cros_ec_commands.h b/include/l=
inux/platform_data/cros_ec_commands.h
> > index 69294f79cc88..9cbf024f56c3 100644
> > --- a/include/linux/platform_data/cros_ec_commands.h
> > +++ b/include/linux/platform_data/cros_ec_commands.h
> > @@ -2005,6 +2005,14 @@ struct lightbar_params_v2_colors {
> >       struct rgb_s color[8];                  /* 0-3 are Google colors =
*/
> >  } __ec_todo_packed;
> >
> > +struct lightbar_params_v3 {
> > +     /*
> > +      *  Number of LEDs reported by the EC.
> > +      *  May be less than the actual number of LEDs in the lightbar.
> > +      */
> > +     uint8_t reported_led_num;
> > +} __ec_todo_packed;
> > +
> >  /* Lightbar program. */
> >  #define EC_LB_PROG_LEN 192
> >  struct lightbar_program {
> > @@ -2086,6 +2094,8 @@ struct ec_response_lightbar {
> >               struct lightbar_params_v2_thresholds get_params_v2_thlds;
> >               struct lightbar_params_v2_colors get_params_v2_colors;
> >
> > +             struct lightbar_params_v3 get_params_v3;
> > +
> >               struct __ec_todo_unpacked {
> >                       uint32_t num;
> >                       uint32_t flags;
> > @@ -2143,6 +2153,7 @@ enum lightbar_command {
> >       LIGHTBAR_CMD_SET_PARAMS_V2_THRESHOLDS =3D 31,
> >       LIGHTBAR_CMD_GET_PARAMS_V2_COLORS =3D 32,
> >       LIGHTBAR_CMD_SET_PARAMS_V2_COLORS =3D 33,
> > +     LIGHTBAR_CMD_GET_PARAMS_V3 =3D 34,
> >       LIGHTBAR_NUM_CMDS
> >  };
>
> Haven't seen the change in
> https://chromium.googlesource.com/chromiumos/platform/ec/+/refs/heads/mai=
n/include/ec_commands.h,
> do we need to wait until the change landed in EC firmware?
For reference, crrev.com/c/7515877. Will post v2 once the change lands.
