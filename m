Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5D530F555
	for <chrome-platform@lists.linux.dev>; Tue, 13 Jan 2026 10:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768300686; cv=none; b=LrjeedqO9U9AjlD7sV3b/cDwLWn4Qj2ERM5W3RBVjy5MQnd9OFlbpxE0t2TX4jN/iASM5fc/Gpx/dZtSNJNh6n9hNCVvZvUGxvobpuUImlsetBJX7SDJPRc/y3ofcXhh7gQrv7TwsTpyicSZxJVf0lj+FuC7alaw/M6BvCKXYno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768300686; c=relaxed/simple;
	bh=mxOcD1cA12y/6rHKrAjW+DtvChOgFYiutRcSmEc8Wp4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ayhH1SDGEO5Jzcmqn+y7NuDWfpnstMmZz/OA7vJBZ1iV73cGD3VNFq6Zz9Gg8Oh+MzMgcjWJDNuOV7TrFMcB3thGqF87Gwrqh9AxXljPsO07kVmk3PpMmvunqPXzoc94EIvhJck/8+lmztmrPt5FiQLagYvBmJe+mxWG66B9R6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y7Gs7CP3; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y7Gs7CP3"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-47eddddcdcfso1198985e9.1
        for <chrome-platform@lists.linux.dev>; Tue, 13 Jan 2026 02:38:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768300683; x=1768905483; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mxOcD1cA12y/6rHKrAjW+DtvChOgFYiutRcSmEc8Wp4=;
        b=Y7Gs7CP3R+wGS0tWNp0K01t2/XqcEI8WnrgY+E53Ewrt/8A+AvRoFeLQMF+qafWeV5
         n7Ork4OQT4UhE7Jl2YpBGa0QANCQGYdfOMbO61Ho4P4qvMLbI7ftY9LXXmLKoV//s/T8
         zSwOtkG5QWq/Tz5sT5djE8jnyDAu4fwY7p4BZczZYvP4A63jI66Lfs8UeGb4X5UuuU1Y
         zz13sQNZW88UpDejefyv/3DNiKA14rBMxrou6IIsfacV9BTT9YHFFfV6DzrXou7ZeVCV
         uqdRCDp84w0UbVsYJg3zwMX7wcjHgIeXZvpqkm2Luu3vHZntHd3QkkfgiJ4SVmAZcoWy
         9Pzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768300683; x=1768905483;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mxOcD1cA12y/6rHKrAjW+DtvChOgFYiutRcSmEc8Wp4=;
        b=BiJPDfJgpgiLUMpa8a4IacmFTxcp3qXr7jmsCUb6CjLGv74aawmn62By/0F8RY/nsV
         QPDBlpW6NCTdxKs8yZLQJy8GPjTXDQZqiIRWnCJa/7VFnBEmGCzBvblYL7xmCYEt2/cy
         4/auvDPW7t97PbUQcJp5p2AOHKZIPSBwG77U7P9XUd4t8sbJ2ZKG66izM1phnnjIGRQv
         /ak7ANwB2PmFHjNmz3AyNNWh4aw9seGKLl5gojpsiM32JCzJGLjcwuXox3MX0zZZN0g9
         7CJs0sfJ/aV2TiCIghuu8Kigk04ZeTSC3yWwHxJjBgxHtuC8Pw9aGLy/MhmHwo7vwbv2
         6R3g==
X-Forwarded-Encrypted: i=1; AJvYcCX1wmTIBDB5r5TcrRuTgeMhY87Hx/jj/wdQVkAfAg+mLZenkJJsOgGKICdFXRc6rnY074KAFvJVUZUZaYzO7qY=@lists.linux.dev
X-Gm-Message-State: AOJu0YxuIg9uUeo4wgN1xOT6yGr+uJIrJHo5u8Cc+rEyKt5Ywa9mR0pQ
	E9puqe5CyTpHnHeLrl9yf87BsIFRF6/IazwcVMGMA/f9DOYBAVnWOUk9
X-Gm-Gg: AY/fxX6tsnT1as09fzqkmthfMRg9+TG4CyT8I8Sg2p5vZWA1aCbos6e7whpCSo0LosJ
	8hcmbmecVkvFmlBiaCCnD8ERfOF8V2eI0vFYnaMshjIPXBodYuwcFpU9hZ4Fud0i378220AhgUq
	Lbe8ko+9MzOVjIb+xtuvMx3YA+IQ3aHJrN84nwUgiz9O0nt16+HjPuwTs7mCzTXuDh44n7GlXy4
	rjVs68+C3z87wDYIjIp33nGkUn0urNsTMNS1QN3ikMUECWEYILkvnzRbzxASGdIHqUu+XySF/mA
	3oOdLWz/d8GX1NvITWtXZba3CmJzs9g76s+w+9EnHsSxrGWG1UIAEHfWWFKTtyhf11E73hRmYZL
	Z2+XJddU4swLFBokswcU90RWRizYqSz7+Jh+G4IRarwmKvz4MbFVD+5pyFwav6VdIokPw2I7dPy
	PQo36dQCDcXeFT8Y6y6DE=
X-Google-Smtp-Source: AGHT+IGZWI8BC0XO4q/PcONBO/S1NJ8k2S4bjAnGk5dNdRHI+QqShN6+xW8K63IsOGXYRmKeEVVOOw==
X-Received: by 2002:a05:600c:19cc:b0:47d:264e:b35a with SMTP id 5b1f17b1804b1-47d84b19f69mr237676935e9.13.1768300682455;
        Tue, 13 Jan 2026 02:38:02 -0800 (PST)
Received: from [192.168.1.187] ([161.230.67.253])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f65d9f0sm409588395e9.12.2026.01.13.02.38.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 02:38:02 -0800 (PST)
Message-ID: <98897c0488e67f543f437b96412c78e10a59a81c.camel@gmail.com>
Subject: Re: [PATCH v2 3/7] iio: core: Match iio_device_claim_*() semantics
 and implementation
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, Kurt Borja <kuurtb@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, Lars-Peter Clausen	
 <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, Benson
 Leung <bleung@chromium.org>, Antoniu Miclaus <antoniu.miclaus@analog.com>,
 Gwendal Grignou	 <gwendal@chromium.org>, Shrikant Raskar
 <raskar.shree97@gmail.com>,  Per-Daniel Olsson <perdaniel.olsson@axis.com>,
 David Lechner <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?=	
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Guenter Roeck	
 <groeck@chromium.org>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	chrome-platform@lists.linux.dev
Date: Tue, 13 Jan 2026 10:38:44 +0000
In-Reply-To: <20251227144707.1bebcf27@jic23-huawei>
References: <20251211-lock-impr-v2-0-6fb47bdaaf24@gmail.com>
		<20251211-lock-impr-v2-3-6fb47bdaaf24@gmail.com>
	 <20251227144707.1bebcf27@jic23-huawei>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Sat, 2025-12-27 at 14:47 +0000, Jonathan Cameron wrote:
> On Thu, 11 Dec 2025 21:45:21 -0500
> Kurt Borja <kuurtb@gmail.com> wrote:
>=20
> > Implement iio_device_claim_buffer_mode() fully inline with the use of
> > __iio_dev_mode_lock(), which takes care of sparse annotations.
> >=20
> > To completely match iio_device_claim_direct() semantics, we need to
> > also change iio_device_claim_buffer_mode() return semantics to usual
> > true/false conditional lock semantics.
>=20
> I wasn't rushing to review this set because I want it to sit
> a little longer than a typical series to get more eyes on it.
> Anyhow, long enough for this version at least!
>=20
> Whilst I find it hard to care strongly about out of tree drivers
> and in place flip of the return logic seems a bit unfair on anyone
> trying to keep those rebased on mainline!
>=20
> So with that in mind, maybe we need to name it differently even
> if we are getting rid of the old implementation all in one patch.
>=20
> Given earlier discussion about this one being rather more tricky
> to name than the claim_direct because claim_buffer sounds like
> we are grabbing the buffer, I'm not sure on the best naming to have
> here. iio_device_claim_buffer_m maybe?=C2=A0 Ugly though and
> these are super rare so maybe this isn't a particularly major
> concern.
>=20
> Given I think the people maintaining most out of tree drivers
> are Analog Devices maybe this is a question Nuno can answer
> for us?
>=20

Whatever you prefer :). I'll be the one taking care of any conflict
that comes and I do not mind dealing with something more painful if
the diff flow makes more sense for upstream.

Also not sure we have any out of tree user for these claim buffer APIs

- Nuno S=C3=A1
