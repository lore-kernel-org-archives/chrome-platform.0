Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3233AE18E
	for <chrome-platform@lists.linux.dev>; Tue,  3 Mar 2026 14:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772547255; cv=pass; b=J48spxV9v+GaKzznx8PETxSuyPfV9fUexL7aiIK4TDM9LJEX6vZE5uDimOrqmnNN47XQfQjRvDAhryeC5ujTjvwK9bgEsoK6RPXO02t63To6PmKrvvr+/m0NKYSk5N0RBs6Xsl6+xD4S43KDlXAoqunH7mPqnsNQhcmonknLxwA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772547255; c=relaxed/simple;
	bh=t6SW1sm9M982cFygq5eOtkLajRDKQSWqroBktqJfdBI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ftZG8egDaK8LA/iYOG3bxhRMqbzJ4uTcTqhr4R1hoeSPtlEfngHwAS6N2gXzy5si+WtDIOVsifwZVYnvlwpOx0NhE8h0xkrVVt6dhxrxVRV9zkvh3STJToiTxDn/toqhUNcJcwcibjwaZInbcYQwTKwHgtsOqWgWI/5WdB5BiSY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ee8L4G4A; arc=pass smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ee8L4G4A"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-389f933034cso77302631fa.2
        for <chrome-platform@lists.linux.dev>; Tue, 03 Mar 2026 06:14:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772547251; cv=none;
        d=google.com; s=arc-20240605;
        b=MFjEHIg9KAs5EK2J1Yu2vLk/GEv/Y0nZ1UdM+EptaN++FLPre/0u7nkAfaG0XRg2Mv
         7vmj8GuA3ZyJotK7suesUxjL3uZZYvn3tuYuHSQwaHNZ8QjYdpEeh+wMvBMabsjqKeIw
         dO1BDAXgwzgwxzJVlZoIHIlJ5FYeaKQgFZTWA0b/ZBmPIeuGoJPcaGjUUh1cVbxwU+TG
         RH0Fw54PeLgasvBSQ8E+djQ2ebFr8TIToe6xEL+Ypxyf/DmCm+mTXbtif8RC6Lwr9OSi
         gUjBatgxzYYlLBX7sx9KDm8n0awrMFyTwt8oX9FPleEqJXpKSCNxcJqnmWDZBVR5tFtZ
         30Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UsdCJXnxkTNbIWbjZLNJ5b3UIxV8qEBiWBR+b3b28Jk=;
        fh=eSr+FM1Cv0nspn1FXVTbRk2ZD5L79eHba/Y9q7OVpJk=;
        b=j94lrVf0kpLQpEkBqypR1msr+LzaekL8/seCNDlsatYiMt8fuZxFUAT3oulW02wi0c
         GnhXkl0ifqe5sBeULYeI0A/K85DSLErVMzb1ILwiJma8+hLApkafT65KS6Z9iXl3wsUV
         MI4V3dKvJM8I12VLjwp114nfffKOzWoVeuo7EK6rqDbWRECyVkhLktmYZkrwxo08xLEq
         Q+zXZb9oZ0H8/H3l/i2uMzp7lD/Gb0OFMF+IaqWN3P08GWr+8+ZMlpSAn3Dc/a+N0ieD
         CI5DV4w+rAUpfdLrnkBdPTHXYEZ1E83q4YqRqf8wAPNMn2qqI82dKhwbz5klq+S2UlUR
         uRwQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772547251; x=1773152051; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UsdCJXnxkTNbIWbjZLNJ5b3UIxV8qEBiWBR+b3b28Jk=;
        b=ee8L4G4AJS0lqr3Hr/KxJsJwDcCkhNo7ZBTSLEUQOHnz3gPRldM2RQlBcGTPs931ih
         DS7UZDZzH5FuOZl42yNNqkLk8kT6SvndksWKUImuj9KA7getNm70zFVIvE0Q5804meND
         fT8mXVLE22RlpZIs3KWaqAsgJr8m1QOS04sy9MS1sSjTO0+sRqp621S/MRNCtMle54VQ
         ntuNUUBHFPTRX3/ADBTuw+XPEGnh/eYMLoA3F61UakW8bQwzOhiAT1DHj+oryVSedd4i
         QQ4njEavTAw5ZI2x+qf+3A+uBXV+FfPFATEbyYe0j8W0n/3omIzL/MK+4+gPtanXOUPF
         2u0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772547251; x=1773152051;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UsdCJXnxkTNbIWbjZLNJ5b3UIxV8qEBiWBR+b3b28Jk=;
        b=VI8Jh/xIVvM2zoPmAet97IyBp/+UHm8OwCX0aaHS6kgSIxV2H6SxOmleSrpl9aCXZg
         0Im7krlcgT3iaYkz0LWbCu3YTYTamwK9LNH+Gf24m7QkRAHT0oDBJSEfVyXQV+Y1g85I
         qMVpibZIiaFq+Cs3chzfEsYn2+pqIhuBXrJvhYf9S1rOueMZ7q7dNWcGcqofNSYbjyKe
         79NQKub3o2L/SLla5ZORb1/cTJ6oN7KCPqTInLV4VZJZM0iJkFPYcW5ELkKCS0MZUsH8
         xtSEkEojbNw0ZIO5ewF6PTXamMAxZa6N+NgJrDcE4+a8JVU8V7D+nolvvLwMYyLWhGmd
         vwyw==
X-Forwarded-Encrypted: i=1; AJvYcCVM0VFVKIZi0DjVwZStEFGaJOP44m7B2hgn7SD6lWLv8koVvBVOw6ZTVeD10yRtISW/J6oz3VmkJAEwrZJrPYY=@lists.linux.dev
X-Gm-Message-State: AOJu0YzFRDdy+eJDhb5wNnQHCwT3RcdAQ3xLqQsS3Rr5K7ZT7IP4eYVf
	Z5YREYmL5Zur+q4pVEhwcdO6chL70ibSONGIzppzBGG6nHSOS++MQShkM+cAFUec76KaTPr7RiG
	1Ay17+Y6KKpWMTZv2s2PDWIpZowYl0Hg=
X-Gm-Gg: ATEYQzyxk7K6C3Pz3rTTMrx67o29NFfFjQjzujVe6QPR8sGj9l7kdcTxXF9FkboT4qE
	hk4WcKf/F5w6wrvz5KAT3czIn8320xrPvE7qKRq+KsFv8fWhjYF6DDWddIbXEEdSVRIY7kQ9rgW
	LIWUjKmj8JInns9qLFgJ3BHHqAiXLMMBxo4iGA/hWHsqzknpHF5PyURg4lTCqARO6AQeJYrBiRQ
	Uxdjqfd1QJiYdrIsw1PFtfcSaJrLuIW4r9Jv+3gYIx2rfuoczjbgF9ohIK3rgEAeRaGnEUguBhq
	zaUM2wEjJd4SlwLj
X-Received: by 2002:a2e:be89:0:b0:38a:217:5e98 with SMTP id
 38308e7fff4ca-38a02179e23mr103446121fa.38.1772547251117; Tue, 03 Mar 2026
 06:14:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241213233552.451927-1-abhishekpandit@chromium.org>
 <20241213153543.v5.7.Ic61ced3cdfb5d6776435356061f12307da719829@changeid>
 <cd1506b7-0438-4505-946e-4fc90961d3e3@gmail.com> <CAD3SCTF7CG342tLe4ShMJHczrMUvnSRTxowt-EsGD1tt2TKmjw@mail.gmail.com>
In-Reply-To: <CAD3SCTF7CG342tLe4ShMJHczrMUvnSRTxowt-EsGD1tt2TKmjw@mail.gmail.com>
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Tue, 3 Mar 2026 17:13:58 +0300
X-Gm-Features: AaiRm51sYXlYeemsCl43cf-AXd-V666gWKpMA9rTX0bg7lcBRT3oFtT4DMyHm1Y
Message-ID: <CABTCjFDeKjfi_7zx0jkss=BPL-M2oydTbz2Hu7KGFJsZj21Wiw@mail.gmail.com>
Subject: Re: [PATCH v5 7/8] platform/chrome: cros_ec_typec: Thunderbolt support
To: Andrei Kuchynski <akuchynski@google.com>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, heikki.krogerus@linux.intel.com, 
	tzungbi@kernel.org, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev, sboyd@kernel.org, pmalani@chromium.org, 
	badhri@google.com, rdbabiera@google.com, dmitry.baryshkov@linaro.org, 
	jthies@google.com, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, linux-kernel@vger.kernel.org, 
	"akuchynski@chromium.org" <akuchynski@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 2 =D0=BC=D0=B0=D1=80. 2026=E2=80=AF=D0=B3. =D0=B2 14:31, Andr=
ei Kuchynski <akuchynski@google.com>:
>
> Hi Dzmitry,
>
> On Mon, Mar 2, 2026 at 10:36=E2=80=AFAM Dzmitry Sankouski <dsankouski@gma=
il.com> wrote:
> >
> >
> >
> > On 12/14/24 2:35 AM, Abhishek Pandit-Subedi wrote:
> > > Add support for entering and exiting Thunderbolt alt-mode using AP
> > > driven alt-mode.
> > >
> > > Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> > > ---
> > >
> > (...)
> >
> > > -     amode =3D typec_port_register_altmode(port->port, &desc);
> > > -     typec_altmode_set_drvdata(amode, port);
> > > -     amode->ops =3D &port_amode_ops;
> >
> > The last usage of port_amode_ops is deleted here. Is this a mistake?
> > AFAIU from kernel docs, port_amode_ops needed for alternate mode driver
> > to send vdm messages to partner. Now, when it's unused, how does
> > alternate modes work in this driver?
> >
>
> The assignment of the typec_altmode_ops struct pointer is still here;
> see the cros_typec_register_thunderbolt / typec_altmode_set_ops
> implementation.
>

It's the .vdm callback implementation(cros_typec_thunderbolt_vdm) confused
me - as per docs, port driver's .vdm should be able to send and
receive vdm commands, but cros_typec_thunderbolt_vdm don't do it, whereas
port_amode_ops.vdm do.

So port .vdm callback just imitates vdm exchange to satisfy the altmode dri=
ver,
while the real work is performed by .enter and .exit callbacks.

Old port_amode_ops can be deleted because unused.

--=20

Best regards,
Dzmitry
