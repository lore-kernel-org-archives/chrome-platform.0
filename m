Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC883876B6
	for <chrome-platform@lists.linux.dev>; Mon,  9 Feb 2026 19:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770666804; cv=none; b=LuAMAoa4WL3zdT1EWscJ+JGZkC2wrrZg+T7pAaGBTZJ/wPAkCkhnwBAKJCOhHSr+6fHCOJzTHUxFt4lkxsOFuvwaAn4fQKYwxty9DuZ3jL9bBjcnK8Q4oKv0p7BlAESPUUtHpARp2sjhMXJXN73HVtWiyKVF/Cp+1p2KGSID10o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770666804; c=relaxed/simple;
	bh=qsOoJypqm6WAX+ButUfaboUhpaZ54vhFpFpfnB48kCE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N2u4bKS2zwQsuzgCGrXVXm8p2RO1bifmsUBtbucLn1ZAEMoJLJpQ2orPhg/fAlBhMJCNs5hkB4XKIAiOuNltAJ/sfSycIRIxvKGHx0YlUJr7NouC3SYgwI0joyq2xV+S71GP5Zg5C893s2mc8dRk9cOhOzHyBf613Oes59pnRbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BkTn6URY; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BkTn6URY"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2ba68df3687so2624231eec.1
        for <chrome-platform@lists.linux.dev>; Mon, 09 Feb 2026 11:53:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770666804; x=1771271604; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BwydA4iUO74qwBfrwUHAcE351+AL9tRs2Ti2OZrDnSI=;
        b=BkTn6URYExnRWhyDvKmyWOMZ43XQeSOLElA+6KsYxlRZrFtYc0fYBDdi1a5GCfJw74
         Wmn5ITIJQ/VvrfVPyJE9SeIZ815YmgXnsxd9nEoHXKjyY6jl/1ZAV5/olKJ3ho9XuMJX
         h46jzXeJclM+UHqomVinp6B6nrB4TIxJtC+pGW5zyRlAUm1/i2gt9rm3rZFwn1bGLUR+
         deYIOSH6Fhq3iWk/FiAZWLbRVWZV9rgmEPo+gomBcdjaKCTO7S5j1GPDxWT9vO/bT9sZ
         36nTzbY1L4Bp4p+ml+x5WD3qCbVt7M7BSzzCZValLwuE3F5dC0HX8RW4r0RlgYDILy2X
         pL4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770666804; x=1771271604;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BwydA4iUO74qwBfrwUHAcE351+AL9tRs2Ti2OZrDnSI=;
        b=kF7kcLS+BuEdY5+rEP8syoa9d/iFNZ0adOcCCvTOsp6PddJ/eY66WpiZg4yRbQuIa0
         NT+cYKRAKavXcaSV6ajNH9A8dz4CphjcQOR6CubpaNY1nfEchUQCNQ4sH8DP2BwxYc/x
         6PopCuZjvVvxkoBPB4CR0FqnMAuoyAvVST4wYoSisR6qqFwNqyh0sy49vNCmUSsQdalw
         Ah4G6Eyd+753Wkj3dzJfBrtTy0BuLaYbX8gYUh6TgUQ7WxGT50/Q/GsLD3Q6cuJ56pkD
         w4WqyrhocZuCa82bbiyAYxHGoCqYWVVMfya3nBD2n++GyPnW7PswJOvlyIVFs8NWl73w
         tkQg==
X-Forwarded-Encrypted: i=1; AJvYcCX445Zmo/3GhUSRm1ZOiLMb9YApx1pkiy7HCYclOkSbMJpcBsICrmDfRg++szF1hvHLrBNeBsKFWIGJztkJB7Q=@lists.linux.dev
X-Gm-Message-State: AOJu0YxY/8LUeplAV67FVRIjELSVkHbXdCFv/rvpA0OUzG1u3H5zJiqa
	TLUOKkegEei++KuhTgJcViBHjI6vvOBPPHhTZI0xY07J797W2u9UsuEW
X-Gm-Gg: AZuq6aK7P0kakh5TyRsv4YxfmVDohRI8lSJJtyf9L78xvk8+GDNLAGS4Arn3qfk0dnf
	XcyhBh2QXsaQ0bbE2PtGlaj4igDQd5xRqg7QT1mFCe35kTH0LkXDG7f2lz7Bn/zjBG2twf18LLu
	dZgrI5apD2TO+7EYS01Kbz0ufXfOfB8pagndaL4a69+WkWsLw/kzp3H2EVFlN1my1NMlLOKk5ZZ
	jchUMBFgYFKG2jGxh2GjpfPzTkN93d1JpVlr5ITE0zq184Re84dCBOnpVot9IRHkO38HWxQ2v8J
	zO71QRaoWUGXb9yRZAlpTDHmIRbsv5Tlld+I8nNw5nA7AWnfecN3RE7w8g/cFKuqyZO5O1YM5hz
	J69nd4QfKHq7qFg+7ASnAchC5L5T+LPAhjj8JKeGGwXi9xQJqp86gRO9Hj7he0XQ/bVMk4298ma
	7NHBeX+SW9se1hwxqBIqP/bv6wR9dNaffvX4RrZJ0QkAY5LBMl4iM+
X-Received: by 2002:a05:7301:3d0d:b0:2b6:ffb9:9633 with SMTP id 5a478bee46e88-2b8564a69a5mr5511786eec.15.1770666803737;
        Mon, 09 Feb 2026 11:53:23 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:616e:78a2:cc03:4be3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b855c89695sm8073859eec.31.2026.02.09.11.53.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 11:53:23 -0800 (PST)
Date: Mon, 9 Feb 2026 11:53:17 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Fabio Baltieri <fabiobaltieri@chromium.org>
Cc: Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Simon Glass <sjg@chromium.org>, linux-input@vger.kernel.org, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/1] Input: cros_ec_keyb - add function key support
Message-ID: <aYo61iE8OWggDucS@google.com>
References: <20260112093309.240905-1-fabiobaltieri@chromium.org>
 <20260112093309.240905-2-fabiobaltieri@chromium.org>
 <aYYTgxi0mcPVgpTr@google.com>
 <aYoBTEgrirtcW96F@google.com>
 <aYoZEztHrIx5CzwQ@google.com>
 <aYo2cYhd-XCcLa43@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aYo2cYhd-XCcLa43@google.com>

On Mon, Feb 09, 2026 at 07:33:05PM +0000, Fabio Baltieri wrote:
> On Mon, Feb 09, 2026 at 10:20:52AM -0800, Dmitry Torokhov wrote:
> > On Mon, Feb 09, 2026 at 03:46:20PM +0000, Fabio Baltieri wrote:
> > > On Fri, Feb 06, 2026 at 08:25:14AM -0800, Dmitry Torokhov wrote:
> > > > 
> > > > I do not believe this flag is needed. Always do FN processing. If there
> > > > is no FN in the keymap it should work just fine.
> > > 
> > > The problem is that if there is an Fn key and a keymap, hence we process
> > > the Fn keys in the kernel, then we don't send the Fn events, but we
> > > currently have devices deployed with an Fn key where the key is handled
> > > by the userspace and they expect KEY_FN events to be emitted, so if I
> > > let the "fn keymap" logic kick in it unconditionally it would cause a
> > > regression for existing devices.
> > 
> > Hmm, I see. Then I think we really need to have it as a device property,
> > because keymap can be manipulated at runtime, so depending on it to
> > switch processing seems weird.
> > 
> > It is like autorepeat, either device configuration asks for it, or it
> > does not...
> 
> Ok, the DT folks were fairly explicit about not wanting anything that
> even remotely looks like configuration into dt. Right now the behavior
> changes based on what's in the keymap, which I think is fine.
> 
> I see the keymap can be manipulated in runtime but then I guess I could
> just install a custom hook to idev->setkeycode, recompute
> cros_ec_keyb_has_fn_map() and then call input_default_getkeycode()?
> I'd have to make that function public but then it'd automatically change
> the behavior in runtime as keycodes are defined/undefined.
> 
> Would that be acceptable?

OK, let's see how it will look like. Exporting
input_default_setkeycode() should be fine, we just need to stick
lockdep_assert_held() there to make sure it is not called without event
lock being held.

Thanks.

-- 
Dmitry
