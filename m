Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157021DF73C
	for <chrome-platform@lists.linux.dev>; Fri,  6 Dec 2024 08:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733475345; cv=none; b=Ph5zyVp1OFr5Fc5srZfyOc38nDKw8Z+3cfIKrLc6NTSKtJbTinS/D6YLWcoTnycJcgfgm0BBBZRqhhxtUcR4UIuMvUi2fa3Xib2Oaq0rY2TJEuqDbUHMhlliKMxdai+KFvY8Xkfl6XtNdg9d6VvRHyvnSY5wmlEWIrp+f96Q4Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733475345; c=relaxed/simple;
	bh=K4VXv+Bl3TwM7KWxXQLUm6Ey2+mMwbatbCupddqxicI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=beFAzwj2XjHRvhWzF0ge8oVuEdgfBv2oEP0OGlKXpL+nwLLYvnwksRMxVmA5y1QetmqjM+e21aVKeUbgJChNT2ju2EisEv72COuU6aV6rXRUGGwh4YycIaR5WxExMu3v/zT2CN7ScX8sc6hk/KiOPP5j/yLd3FjeTCdwpGn4JhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=U1FJTLPr; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="U1FJTLPr"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6ef81222be7so15261947b3.3
        for <chrome-platform@lists.linux.dev>; Fri, 06 Dec 2024 00:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733475343; x=1734080143; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fB1lXFAba1EHLXEp5g/a09c/v/j02AjnIsWH8/a2o9U=;
        b=U1FJTLPrlsBCfBKLmABIAN4PrWSjjmDg13kIn4VcEzphpi+q4/XyOUP900YNIqRf9u
         3FNYWKevGdWf+Zy4FrIFddihpbf3xwOy7rEZvEde1k9Jdo5ehNQ0eONkRiQlW/c6NGj0
         hHeBn8YmXqw7vBr+ZlOxdolR1YDtZDdQwiotY5L4bl24zd1xo5GEV327bqfiCv52W7Gv
         8g35g8haqYP1+2Puxxormf21d96eOwZe8I5VBtVIxdEw8+e9fU6E1s9MBSaMKcm9LnLX
         vKWHNCncYCy9ASaecMeIgsPDuaZgUtOXpJt3DmtuGxpBbEPg4IgLuH2LLuSYNIf7QS+Q
         W9Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733475343; x=1734080143;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fB1lXFAba1EHLXEp5g/a09c/v/j02AjnIsWH8/a2o9U=;
        b=GNEpo72LUe9Ti1UNiUV536yDbAYjOf3pic7OT8XO6tp7TVKSrqlpeoaANYaNeNd1lX
         0iS/mYEjSuM99S8x66sCH4RdUyE4r4fEo4vKpmrZrNBPzBKkyCepuVArcvK223kgP7WB
         AgTRV1G/X2Et2qMvK9N29DErrK0PYO+PVyTblmstDplXvJGOjhRTP7OvwFqEOxiUz/2H
         wJXRldbC7q4XqeSUgQjotONYFlr3kqKzLFRBelZ00WXQP7J7Iq3OPl+vhYZ6AuA8KfzV
         TBfWuXDNMvwiL5DuzDe7Xz9+wBF5NPGx9M6Iih9UiMjDL9GivfqAM2ajtkMZZfBRk6/X
         82zQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPwGGOBbu926mtFSRJsrglBLwKZZCuZeMz+eO3tT7cpm9Cs0Bf+Q9wf9LNIT1XwZJUnkKrqPs6BSEKB2apaa8=@lists.linux.dev
X-Gm-Message-State: AOJu0YyRs/o6Vm9pDoB1nUHnoVPoJ1f9uc5M7pHJUagoK2wcpnvbAF60
	mryUQ5ZZ3iEwbFxU1hRMUOJIKAjDUCsKnnl7aBmmXJC5fWQ7UMVIpURDB+9yuRXLj7SOs981Ee/
	fywrz6ezbxIr0BJF2QURWHEeQ5E5tmVOfW70A
X-Gm-Gg: ASbGnctAqAWSXfia7J9la517ZYiALDoj2C3pZDuizZ8FsxxCS4mao2Q7sKEPEDjQQhr
	n8Iqx4cMBns6QILL3p+VbL1GKqMX4yQ==
X-Google-Smtp-Source: AGHT+IGtmvIG3QFiq5VWSdE96AkQy1GTIbz0u0OzgBoMZwxE/J9c+1zsJP6yOLKJsYTPPNmrB+CNwCy4+DFjJf8dokk=
X-Received: by 2002:a05:690c:46c3:b0:6ef:6f24:d092 with SMTP id
 00721157ae682-6efe3bf49f3mr26570807b3.1.1733475342821; Fri, 06 Dec 2024
 00:55:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241204104514.1541964-1-dawidn@google.com> <Z1Jc4XC9z5lnYc4H@google.com>
In-Reply-To: <Z1Jc4XC9z5lnYc4H@google.com>
From: =?UTF-8?Q?Dawid_Nied=C5=BAwiecki?= <dawidn@google.com>
Date: Fri, 6 Dec 2024 09:55:31 +0100
Message-ID: <CAJ_BA_D0S1oFQiH2odVgfnd9dL76_t5Tzc_0n5B+fVis21+sAw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] platform/chrome: cros_ec: jump to RW before probing
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org, chromeos-krk-upstreaming@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 6, 2024 at 3:09=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.org> w=
rote:
>
> On Wed, Dec 04, 2024 at 10:45:13AM +0000, Dawid Niedzwiecki wrote:
> > diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform=
/chrome/cros_ec_proto.c
> [...]
> > +int cros_ec_rwsig_continue(struct cros_ec_device *ec_dev)
> > +{
> [...]
> > +     for (int i =3D 0; i < RWSIG_CONTINUE_RETRIES; i++) {
> > +             ret =3D cros_ec_send_command(ec_dev, msg);
> > +
> > +             if (ret < 0) {
> > +                     error_count++;
> > +             } else if (msg->result =3D=3D EC_RES_INVALID_COMMAND) {
> > +                     /*
> > +                      * If EC_RES_INVALID_COMMAND is retured, it means=
 RWSIG
> > +                      * is not supported or EC is already in RW, so th=
ere is
> > +                      * nothing left to do.
> > +                      */
> > +                     break;
> > +             } else if (msg->result !=3D EC_RES_SUCCESS) {
> > +                     /* Unexpected command error. */
> > +                     ret =3D cros_ec_map_error(msg->result);
> > +                     break;
> > +             } else {
> > +                     /*
> > +                      * The EC_CMD_RWSIG_ACTION succeed. Send the comm=
and
> > +                      * more times, to make sure EC is in RW. A follow=
ing
> > +                      * command can timeout, because EC may need some =
time to
> > +                      * initialize after jump to RW.
> > +                      */
> > +                     error_count =3D 0;
> > +             }
> > +
> > +             if (error_count >=3D RWSIG_CONTINUE_MAX_ERRORS_IN_ROW)
> > +                     break;
>
> Only if `ret < 0` makes the condition true.  How about move the statement=
 to
> where `error_count` increases to make the intent more obvious?  I.e.:
>     if (++error_count >=3D ...)

Good point. I'll change that.
