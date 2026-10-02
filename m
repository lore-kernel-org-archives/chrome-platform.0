Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A502439F80
	for <chrome-platform@lists.linux.dev>; Fri,  2 Oct 2026 19:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790970998; cv=pass; b=sAZEv2tH3M1Hq2r4l9+WkDOBBWoHbrRUdl2RbxNEDAG5OtO1HyrprINZleXeCwdlZ5G8poamTf+GJeHdqnuiO33gL54A10qJctaOckN4iCt+v+aZyhW9V4avMlFERsCHLPJyff4wKsnthneqlr2rkfpoVXjV2uB/ol9PXdGqGro=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790970998; c=relaxed/simple;
	bh=1ioCZTbb41W9FUOixCvFBhIck+r0y9BJGbVcKNL0CmM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=atZEeK9EHsjnLnFL9WDJrMhzhdJ8emEMOJskwUSPdckQeaI2Ym9LaTwQAe1JFAMmZhhY2ElmywahZG7SL3O/ei7cm+3tn9u47i7KWv2wIM7d/nCIkqf2vwUmstvl5Aus4RyE/fmxX1STJoO1lW2uV3XFaHayRU3ffOLEwvlT0qg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aYvoFPlD; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aYvoFPlD"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6ab006eb282so1658316a12.0
        for <chrome-platform@lists.linux.dev>; Fri, 02 Oct 2026 12:56:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790970992; cv=none;
        d=google.com; s=arc-20260327;
        b=CjOE//PMBM/OHPNN6h/RAB+w2R8lOswnndhbfpupm/kqJO+J1in6UQDHjoUwjze6Ss
         S5Imu1Zbx30u78q2cel4Hodc5gUedd8Bw1uUcgwMRFfXIbzYaIBx8XdED/habK60gkyj
         2LC32mNZ2xQ6Af2c5s3ZlHYB3yfY2iylWS8gLene0C0ss/sMY99VE4TcA+RNRey+IpvL
         ga8qhVxP5+z149THJdeWsxpQ0BjHLJTKB56EH7VPGzQcTq9YjCQ76E6so30GjnooMoEg
         k9sQ2L7opYspWv4nnsbtjxwrXZq95k8VYGKBjF6ZtRACQ/vxsVA0dfU32qAKdf6sSCtx
         I1jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BIxB+o9asvwUGZP/ehweqbShcz/sSoH+9KFLtoHp1eA=;
        fh=FkOswz06L8XlrmoORgG0qQ6CKv9i8LwrkzrjaUJtt/Y=;
        b=iW6aSvVYlja0x23k4rODn85ykYj3sZ7yYGxo/0lHHuy5cUB+LZypE5V/B4S76LV/dV
         wY1jhXtvXMUUCZILkHrGxkB2OAVGov+C3tmsTE8uDYqjUqkIOtCwTMQehAiP4dw6pvNq
         OVPokohXcuUSL5hNIWyOB4Kb/F4f5uHmpftdnsScwmTLM8aOh3x1sfyEExjMQ3GYh90u
         lQSG3Oy6Ta3EhzXictu2C2VDx5SOGwpbilmd0Jr6z3f4UuGpwrxbkrfjStGjvY1FJL/d
         qZ/j4Qc63AgSJbIRkUvjST8pD9hnI2wETnLjVjdQS3gueXHDr3Q0bXw9LtkJA+3iVjCQ
         MRyw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790970992; x=1791575792; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BIxB+o9asvwUGZP/ehweqbShcz/sSoH+9KFLtoHp1eA=;
        b=aYvoFPlD+BS2bHs/hlzyj/TYOB5d+pHvZLAVnFaPltUjI3ccsXoIRrEeNyZmfmGLXX
         8zHj9ffOtcCK8uYNs5wRwi39zw9jgbnbIWcadBrMQShnP2Ix/tcAvEy/PTAznS58rg2s
         3lC9oedzQMVfzTchiP+8kaUorMJ6Lb1yLc17sPBDhZOlJq4b/Cn/TSybAtGhJnRhn52F
         w0TmxxARLoBp9qEse6WaXcjG250lkFZbD5+CzJk1GQ+vn6zXvHiYM5ZHqMwb3XinJtqq
         PiKO5gtB0AJAktlb75WBZdBJ0vPOJswmY+/9KQxf5Y2C5V2FhrLp1jzq/beuWf7S289y
         AAxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790970992; x=1791575792;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BIxB+o9asvwUGZP/ehweqbShcz/sSoH+9KFLtoHp1eA=;
        b=1dAkxXooajCP8FvCLaCxnmU9RSL9aztnNK1bqNoe/H90ik0IbvI5aWvzrryvO5bWw9
         kgfr4TZoypgpdvNClULoImHwhRl+JvTqJ6cfO3pm18PbCtwnFKpXso7AfXi9+l+daZ0Y
         wDTIwAW/fkNm0kuozRkAd5Ooq1z9aRLbQk8aNZRr/KFncNLlZZ83XU7CwY+b9efgPgOK
         kNzpUbSqc8IT/j7HCUkaTC1rEbFNrZjMaYKincSFgmnT6uBLMrEcFyo5oTEPi91gFq00
         ctz2YvQ0zA+fDMYMzgmzIBOssBZ6CH5mRXkNAhfPEcPOyJTrioiAqpEx0XSzdm+GGrNB
         S1JA==
X-Forwarded-Encrypted: i=1; AKwUvBwtUjyFLr/5xcihUo+3COccTMYf1XqCjpL+btpjmEWKzoyeYk2VzOCfKb9na1tPpe9J0YE4al21HxLITiFoJrU=@lists.linux.dev
X-Gm-Message-State: AFuF++ns1kCs9u5SKM0s1xHt8+L9djG+LpKDrtee3izMT2IkoQnFDF6+
	KuuQdASW11WOCNOgIMvqVxNBe3ctCpZAH+2QxcOoZXgYy/RAViaknAO5TJqV8YgBXK/H4TBz+6O
	opTfcRhnXzguXNoFtkN8oznbvb4PiVg==
X-Gm-Gg: AYBFou1d/yQ/lM278SgAczTcRFe2Y/7+rXuI1TKxVzm8lcUj4/x7zC+SHujYW3+t9V4
	MSXivcmIJ/TYmBUwe+oZGLCIORu6dzl4Htbn0T88AguXKKuy+Qup/FMzQ749cFxzwW/hovLefiw
	P1cUiJDpIZrhIoai1sGr/pTpDrPe/0LdsAcxiThOQ0s5VReOrGcQcw5gcxBYA6sX1hP2i6x1A0g
	TWiVy5qRxOurTgZV/anUnE74hPFBRLgYA+Kz9H8/9EhptiWnoife6U+mNyYaT7c3qpLGMf65Z+S
	LvMWSpOidl0s0ZZjUugq342Zch6ezTDv+rEt1x3Z/P0v+jPB5J+N0wTO5h1IW9e4EAOdxeO0cIi
	EzNOm/1DQptcQm2Tt7uEWIHZxtQC5FTIhAyrMHVISILENX6fkQ16MqETUAesdBgveRd7f
X-Received: by 2002:a17:907:970c:b0:c21:9b4b:2690 with SMTP id
 a640c23a62f3a-c2e6ed18a3cmr18544566b.17.1790970992289; Fri, 02 Oct 2026
 12:56:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260917204209.97699-1-mhun512@gmail.com> <arpa-Ps8l8LOwbbx@tzungbi-laptop>
 <CAMMMRMe7g7yj1iOTOc+TCWe=+1cjFA1rG7H=VfjnrY3p7XCKFg@mail.gmail.com>
In-Reply-To: <CAMMMRMe7g7yj1iOTOc+TCWe=+1cjFA1rG7H=VfjnrY3p7XCKFg@mail.gmail.com>
From: Myeonghun Pak <mhun512@gmail.com>
Date: Fri, 2 Oct 2026 15:56:19 -0400
X-Gm-Features: AclHuK9fCvmhfjw1X8Jezy7cxwwOQzz6bhBUeiEHh3Z9gHIC1eoTF30hT-F_4tI
Message-ID: <CAGEsz8G+bdyroK=Fb=YpgWvp+Z3HOGbqkTPt-dYO8u_+26_ULA@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: cros_ec_typec: Stop altmode work before
 unregistering ports
To: Andrei Kuchynski <akuchynski@chromium.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>, Benson Leung <bleung@chromium.org>, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Jameson Thies <jthies@google.com>, 
	Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the feedback. I've moved the work quiescing into
cros_typec_unregister_altmodes() so partner disconnects are covered too.

Pending partner work can still queue responses during driver removal,
so the port work stays disabled until that completes, then is reset and
re-enabled for reconnection. Final port teardown now uses
cancel_work_sync().

I'll send v2 with these changes.

2026=EB=85=84 10=EC=9B=94 1=EC=9D=BC (=EB=AA=A9) =EC=98=A4=EC=A0=84 11:40, =
Andrei Kuchynski <akuchynski@chromium.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=
=84=B1:
>
> On Mon, Sep 28, 2026 at 12:18=E2=80=AFPM Tzung-Bi Shih <tzungbi@kernel.or=
g> wrote:
> >
> > On Thu, Sep 17, 2026 at 04:42:09PM -0400, Myeonghun Pak wrote:
> > > partner altmodes. Disabling also prevents a partner callback from
> > > requeueing the work while its driver is being removed. Use the common
> >
> > Would the work be scheduled even if the driver is about to remove()?
> >
> > > diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platfo=
rm/chrome/cros_ec_typec.c
> > > index 50a68819ceb7bbfbd888ca919d678d4c75237c26..e91bbc219c07706729493=
5dd5602c1aec636cfa6 100644
> > > --- a/drivers/platform/chrome/cros_ec_typec.c
> > > +++ b/drivers/platform/chrome/cros_ec_typec.c
> > > @@ -378,6 +378,7 @@ static void cros_unregister_ports(struct cros_typ=
ec_data *typec)
> > >               if (!typec->ports[i])
> > >                       continue;
> > >
> > > +             cros_typec_altmodes_stop(typec->ports[i]);
> >
> > Shouldn't this be called in cros_typec_unregister_port_altmodes()?
>
> This should be called in the very beginning of cros_typec_remove_partner(=
),
> or even in cros_typec_unregister_altmodes(). The idea is to stop the queu=
e
> when the partner no longer exists.
> Partner disconnection rather than port teardown ought to trigger this.
>
> Thanks,
> Andrei
