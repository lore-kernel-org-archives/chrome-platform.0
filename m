Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B7922FDEA
	for <chrome-platform@lists.linux.dev>; Mon, 26 Jan 2026 09:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769419170; cv=pass; b=NbI1nDaCRbq/QoegQBvcI45wFfXsnpFL47X+jLpUQPO+WjVYEuaHR3pQj7KgKeCJIWx7x4JirqhlkADs1tbRy3tLasGQzmJMcmDE9mKdFOfh7flSdFhYxtkj+dN2XDyTG9NIyGuOJSLm712oG7GpcilaFUnyrtfTcO/pfXITmgk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769419170; c=relaxed/simple;
	bh=tTmMqoxDsTc2se+JZt8RsgxsIqug8vlWUJMCwJonoD4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GLbWkfXwoIpTO6FhvVGHlnyCwf4cOAYL0986dgm2y16JAMZBzpT3QrLgb03JQOSVxzFF3kHrTrVaSI1+DU7anwy6CVG1Ba6GUtMxTUwsRQzM7wblj1YM9AwSp4Uv9zDRs5An9nE7xBjJeF+lqFGbYKgGtuCoNQYNCm4CAdfqJ2E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jDRbZ6i/; arc=pass smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jDRbZ6i/"
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-947fef8ebf4so3539426241.0
        for <chrome-platform@lists.linux.dev>; Mon, 26 Jan 2026 01:19:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769419168; cv=none;
        d=google.com; s=arc-20240605;
        b=NbOxnic7fRa5Upwt0ys8jQuNzd35Cwa8Cptsd58f+ap11WfVBwg5wwhu4Y9M0QgL1H
         nZrgL72li2E5fzJinSQLfi5Jv9XOwF0iOXKHBcTKHFiZaYqsTEUM+8fbisFl3B3Ja+wA
         /iRgOB8foU3mH15MJwNHrOGnqkj3BUTt7YG1pq+Ijzp1i2MuuNPQr3iozjJc9wGvhf3Z
         3e2GrGdMWYlYXrD/lJ6CYk5sLOrA62+3uHnPE0OOT8FKQ2n8cA/lm1kqsNHIIAAod8pq
         E3EkZS3JATjbBhayRk7tIfuRiQ5nHoHki1fI/tTkG7sLkhC1rJYQ7xdEui9HGa19vIGT
         NRAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uyFuBX38opWfq26XJo+Rl6hqiZmlV8xMuQhfLMPnWXA=;
        fh=Qwb21avUqQbAVaZ9J380FuEPcTXgtwlywuqGobQ5xJA=;
        b=IN9PF8bvSj/NSn8BJRSb3p5sLfPUfeg+nRdt0w3ilZBn+NanTgzQW6wul/G1t269Tg
         MW+hARCJTmvZH5mNI1jgG6HCw6nQG1XOC1wte6lgyw1Lq/HQbfg5Ac/rAYV7GOBAaEl+
         wJIMY4bKaChonRe9iybGY0KFg+Rla9oB4UnyK5yfFihgppiEG4VUKK28XvZKmaEtR4Pa
         wqP05t5IfdccbeomJw2T4unEbwWnlppurQmePJJ2Vas17OVR4KBOK+CbvTyKjsDjcr/x
         OjjaSVZL6RXkcSb1aC5nL0IBIN8bNnAicxtXahi3fRqRq8yuX5bAjmba1DzCmXPR3Pzb
         AT6g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769419168; x=1770023968; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uyFuBX38opWfq26XJo+Rl6hqiZmlV8xMuQhfLMPnWXA=;
        b=jDRbZ6i/6LtJ4VBqDfPklgA/D7dlqOnmZ6KCstkwYel85zwfZpSxa4RihHZyaC7TZq
         d17Y8FcC2ae4MDpMdsW+rkn3uo3KkymssDtqpspQ1LGjzX6Uk5bxiLfXm+AGXO32OKx3
         nTuNWMgayZAJC7U0EEPHp9AD2C2Sb1iUxBnzUjYptWhwUBv5vrhiF0/ja4WgZOwb9rhc
         37Sm/iRSu4KzscamH5H9E+Y5VPHL9ijCoikOm0x8wMZViShAtQdzIYv0xKCcyYoK6J3J
         4Z5YWv+hWhp+HFBDdCRFvin1I2wRNbno3nShMZXgl0lrNmOkU6Cv+herSbG81cn6rgjy
         +j1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769419168; x=1770023968;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uyFuBX38opWfq26XJo+Rl6hqiZmlV8xMuQhfLMPnWXA=;
        b=Jya3cLv5pCoMv5tTAZK3i84P1W3FtkQB3fd47krqMWzyawZD1Qd8POSgTbekeFPW/C
         hWHAmeM3UhzW4JUj2MSB/3/fDz3uefZkqHAzZATxeS0khFUDxp9zxA3dSq1z89/Na4x1
         TbSrlW6NajOf8qM5rH+FTBtc28bw+dEV7lS9HRHSvIv0SP3MaGcQ48H6gjmY/6I5MIK8
         STjKsCr8sdxYgBEfITJI4KHQPzljdqAHmUd/mmvJ8GVty/8Bk14e/S0Ns5Zc1WLsyecJ
         mVXBaMcLsElUXjdRj8CPZ8G/3LAJsXKVS6ne5tA/9VviV9uhaZYw4x+IVIroSn8FNFW2
         rWrg==
X-Forwarded-Encrypted: i=1; AJvYcCW+SpDRH/G2Qc7v3nlnL1QgBxP4zhkW48/dy0ZWDrhRgGmOXQTKPVM/o/1PR6pd3S1x/JrhsqlvuZJLtqb5u1c=@lists.linux.dev
X-Gm-Message-State: AOJu0YwwLEM2pO/E3prWF95eLujHe9iJv6OGsc5mfsnkUeaVBuyOxC+Z
	P1sc+uoyRFJRCgBTEvewPwnV0gCcFJ9XrKHE1/XRvhg7vV7pfvTm5wJ3l2y130uLMdFCcTcGEqK
	qBT2fsQBC6m/KgZCP8eSFb+N5xFtySa0HSMAR0s0s
X-Gm-Gg: AZuq6aKZYnQaoWlrw9L5N9AnP3m6gIh3/uuvK46K2AnrjnsyxLV8dDsmtPU62rstx3L
	sUjZJjjFgUomuY0uct16GmDgrLDZjfdGYv2czzCsUIOI1Gf6ib9wc7wsIywZ9z9scKqudL/EDBd
	XTPwSErCjGnB/AQ76AD8vR2SV0INdDiHVvDqKXw4bRRRptBhqE0QNgj0qr8C915ufm1tS0A/bA7
	SFpTJ7U/Kait5OGXdvcyLtlF6PcjuXad7ybrzBk/Bm+lUF9/BbedDav1LM9TjbAe5+xQZTD/0Ho
	SyLv47jTig768AvfiT9puEeZScWh
X-Received: by 2002:a05:6102:3712:b0:5ee:c3be:c99c with SMTP id
 ada2fe7eead31-5f57741eaa7mr1207283137.19.1769419168025; Mon, 26 Jan 2026
 01:19:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260124085914.836564-1-gwendal@google.com> <aXcUQiEOU-bfj28W@google.com>
In-Reply-To: <aXcUQiEOU-bfj28W@google.com>
From: Gwendal Grignou <gwendal@google.com>
Date: Mon, 26 Jan 2026 01:19:16 -0800
X-Gm-Features: AZwV_QhQK3zQSbw16nbsbr7-Cq10FDlwNnrNJ1wqrgkQsnY4mE7kCUhz9H8_Iw8
Message-ID: <CAMHSBOUN0RobxFG0SA-SgXeRa6nqObBeqaWuJaRphySM886=bg@mail.gmail.com>
Subject: Re: [PATCH 2/2] chrome: lightbar: Add support for large sequence
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Gwendal Grignou <gwendal@chromium.org>, chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 25, 2026 at 11:14=E2=80=AFPM Tzung-Bi Shih <tzungbi@kernel.org>=
 wrote:
>
> On Sat, Jan 24, 2026 at 12:59:14AM -0800, Gwendal Grignou wrote:
> > Current sequences are limited to 192 bytes. Increase support to whateve=
r
> > the EC support. If the sequence is too long, the EC will return an
> > OVERFLOW error.
> >
> > Test: Check sending a large sequence is received by the EC.
>
> Please use "platform/chrome" prefix for the commit title.
>
> > +/*
> > + * Lightbar version
> > + */
> > +static int lb_version =3D -1;
> > +
>
> Does it really need to initialize to -1?
Removed.
>
> >  static ssize_t program_store(struct device *dev, struct device_attribu=
te *attr,
> >                            const char *buf, size_t count)
> >  {
> > -     int extra_bytes, max_size, ret;
> > +     struct cros_ec_dev *ec =3D to_cros_ec_dev(dev);
> >       struct ec_params_lightbar *param;
> >       struct cros_ec_command *msg;
> > -     struct cros_ec_dev *ec =3D to_cros_ec_dev(dev);
> > +     size_t extra_bytes, max_size;
> > +     int ret;
>
> `ret` and `ec` are reordered.  They look irrelevant to the patch.
I reorder the local variable declaration to look like a "reverse xmas
tree". Removed.
>
> > @@ -478,14 +484,22 @@ static ssize_t program_store(struct device *dev, =
struct device_attribute *attr,
> >        * and send a program that is too big for the protocol. In order
> >        * to ensure the latter, we also need to ensure we have extra byt=
es
> >        * to represent the rest of the packet.
> > +      * With V3, larger program can be sent, limited only by the EC.
> > +      * Only the protocol limit the payload size.
> >        */
> > -     extra_bytes =3D sizeof(*param) - sizeof(param->set_program.data);
> > -     max_size =3D min(EC_LB_PROG_LEN, ec->ec_dev->max_request - extra_=
bytes);
> > -     if (count > max_size) {
> > -             dev_err(dev, "Program is %u bytes, too long to send (max:=
 %u)",
> > -                     (unsigned int)count, max_size);
> > -
> > -             return -EINVAL;
> > +     if (lb_version < 3) {
> > +             extra_bytes =3D sizeof(*param) - sizeof(param->set_progra=
m.data);
> > +             max_size =3D min(EC_LB_PROG_LEN, ec->ec_dev->max_request =
- extra_bytes);
> > +             if (count > max_size) {
> > +                     dev_err(dev, "Program is %zu bytes, too long to s=
end (max: %zu)",
> > +                                     count, max_size);
> > +
> > +                     return -EINVAL;
> > +             }
> > +     } else {
> > +             extra_bytes =3D sizeof(*param) - sizeof(param->set_progra=
m) +
> > +                     sizeof(param->set_program_ex);
>
> I don't understand the code.  What does `extra_bytes` want to count here?
> Why `sizeof(param->set_program)` is involved?  I thought it should be:
>
>   extra_bytes =3D sizeof(*param) - sizeof(param->set_program_ex.data);
`set_program_ex.data` is a variable array of size 0.
`set_program.data` is a real array set to 192.
|*param| does contain the payload array for `set_program`, so we need
to remove it first to calculate our payload:

0 ----a ------- x --------------- 192+x -- maximal command size
|    sizeof(*param)                |     <<<< size of the whole command
|     | sizeof(set_program)        |     <<<< size of the largest subcomman=
d
|     | .._ex   |
|  extra_bytes  | available for the payload |


>
> I.e., (regardless of `lb_version`)
>
>   extra_bytes =3D sizeof(*param) - EC_LB_PROG_LEN;
No, because `set_program_ex` contains an extra field `offset`.
>
> > +             max_size =3D ec->ec_dev->max_request - extra_bytes;
>
> Is it possible that `max_size` > EC_LB_PROG_LEN?
Yes. EC transfer on some protocol allows 256 bytes commands. It makes
sense to optimize for what the transport supports.
>
> > +     } else {
> > +             size_t offset =3D 0;
> > +             size_t payload =3D 0;
> > +
> > +             param->cmd =3D LIGHTBAR_CMD_SET_PROGRAM_EX;
> > +             while (offset < count) {
> > +                     payload =3D min(max_size, count - offset);
> > +                     param->set_program_ex.offset =3D offset;
> > +                     param->set_program_ex.size =3D payload;
> > +                     memcpy(param->set_program_ex.data, &buf[offset], =
payload);
>
> Follow up question, if `max_size` is possible greater than EC_LB_PROG_LEN=
,
> it looks like the memcpy can write out of the boundary of struct
> lightbar_program_ex.
It will always be outside of lightbar_program_ex since I use a variable arr=
ay.
>
> > diff --git a/include/linux/platform_data/cros_ec_commands.h b/include/l=
inux/platform_data/cros_ec_commands.h
> > index 9cbf024f56c3..5a2fd6acdbb9 100644
> > --- a/include/linux/platform_data/cros_ec_commands.h
> > +++ b/include/linux/platform_data/cros_ec_commands.h
> > @@ -2020,6 +2020,16 @@ struct lightbar_program {
> >       uint8_t data[EC_LB_PROG_LEN];
> >  } __ec_todo_unpacked;
> >
> > +/*
> > + * Lightbar program for large sequences. Sequences are sent in pieces,=
 with increasing offset.
> > + * The sequences ar still limited by the amunt reserved in EC RAM.
>                       ^ e                   ^^^^^ amount
Fixed in v2 (and crrev.com/c/7515877)
> > + */
> > +struct lightbar_program_ex {
> > +     uint16_t offset;
> > +     uint8_t size;
> > +     uint8_t data[EC_LB_PROG_LEN];
I see the problem: it should be [0] here. I tested with 0, I messed up
during "cleanup" when synchronising between firmware and kernel.
> > +} __ec_todo_unpacked;
> > +
> >  struct ec_params_lightbar {
> >       uint8_t cmd;                  /* Command (see enum lightbar_comma=
nd) */
> >       union {
> > @@ -2066,6 +2076,7 @@ struct ec_params_lightbar {
> >               struct lightbar_params_v2_colors set_v2par_colors;
> >
> >               struct lightbar_program set_program;
> > +             struct lightbar_program_ex set_program_ex;
> >       };
> >  } __ec_todo_packed;
> >
> > @@ -2154,6 +2165,7 @@ enum lightbar_command {
> >       LIGHTBAR_CMD_GET_PARAMS_V2_COLORS =3D 32,
> >       LIGHTBAR_CMD_SET_PARAMS_V2_COLORS =3D 33,
> >       LIGHTBAR_CMD_GET_PARAMS_V3 =3D 34,
> > +     LIGHTBAR_CMD_SET_PROGRAM_EX =3D 35,
> >       LIGHTBAR_NUM_CMDS
> >  };
>
> Haven't seen the change in
> https://chromium.googlesource.com/chromiumos/platform/ec/+/refs/heads/mai=
n/include/ec_commands.h,
> do we need to wait until the change landed in EC firmware?
Will post v2 once the EC firmware change is approved.
