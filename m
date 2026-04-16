Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA2A39F16C
	for <chrome-platform@lists.linux.dev>; Thu, 16 Apr 2026 10:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776334927; cv=pass; b=XPAkG2D0oSyDY8dqBUWiIKvQ1gc/Tlk9WhmIiVJz3kEJ22vOKMFPxMdkAd0jl0v8u6wJOg33q70rfaCaNpJPi3mZ27K/J4C8O5MDzEUBQGUS8Lyh9QJrq5AeR1nQAy2X973X97bsi1+OMJtNC+Dz11jP0c/A+3T7MlAeb1PiU8o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776334927; c=relaxed/simple;
	bh=K5mvVCNzCDCJ9t+YBPnYGHqEKpm38PDyLCEyxp+JIzM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RY7z5D1pdusedSSL9z81DUTF9+LMJ54C2jEW4OvH0ej6Kodf50ssycigyoGmr6rimWjKxCpvQSKE5KvXoTKvH6GCKWgQ4xIZN/c9PD8WBamxYUPOlYjkWNKHh59F0Ni4V3uDc1C+85X8lYuGDO7gcFoTWWst3KgNCJp3QimaoZ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AAQQmesl; arc=pass smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AAQQmesl"
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-652fcd5a6d7so519469d50.2
        for <chrome-platform@lists.linux.dev>; Thu, 16 Apr 2026 03:22:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776334924; cv=none;
        d=google.com; s=arc-20240605;
        b=Ae5t5wWHpZWPwuHwg/l7gGmHZUnxLCb4OeBb1VXJ7mpAfC+SwxOAVJn59zLMTcH4Rt
         sRjgXo2J2+X+m/x6yTwuvKCY+VBwULfvCRXw0wbX7ZnmuysmhHviyNwx8nahjFgl8BK6
         IHZDx7y/WclOKgpxnqx0nX28fltJDqhtje3rMszhC0KH3D6LmRi65jItHs7OTBQAYxF+
         t5nH2AQZw8gzyrAv3NpxavWN89rfxUbyPMh8Au3LiszxhwjqKc+ZXa0VRRTM1s6epeSI
         gHEP06fZI0Oecfi/+df+PKw6fxUrMJLECeefXS4iy9M8fxF3TTpUIj1zSGpwbDdQjiNZ
         ELXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=K5mvVCNzCDCJ9t+YBPnYGHqEKpm38PDyLCEyxp+JIzM=;
        fh=y6tY193+cUjOwulyse+ucWKYMws46FJIXIFI6oZa21c=;
        b=VovtvmFjJe1kh4+2enmNZuauSGxInSEuKadXtLoIkHpqofgLKcYs3rQntw2PX1QXz+
         V8sv6AlFCKVgQ3Jk+5TrshcV5jDRnbgWDB4bJg72UuJpRglJL1pQtibYN6zW1jA1mAt8
         OvkWw8JWZ4VhuzZX02029JWxwoHw/G0+KXiQgwGIFkRj2KLen6FW7FJsR0BIOpM3Vp5W
         an6Nc/uA8XWcdGePIrtgwAXpfstp2H0ZDImO+3HbULJSTvhKEwBEfw6r7rJrXrFMLV/Z
         M6Y1lntcpTX5JL5Vf5oZgC/FwB8IcTizDGoKuuNolQfwudULfLVQky3IAIBy47bINTAh
         Owtw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776334924; x=1776939724; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=K5mvVCNzCDCJ9t+YBPnYGHqEKpm38PDyLCEyxp+JIzM=;
        b=AAQQmeslt36b4DhbYh35ILT0wZdxt08FbepKUOAeV6DQXRHXVDpAg58lJiCUYxebyz
         nlLKB25YaOIuwNJc1tJsQwWxWs5dw7EFJ04adWcxw/LL0BhseqjMJ+sH9Tt1PPeqz5nr
         oA4nsLrUh1UFfrt21LxXj/7ZuB0BhTGS5HU6cWYj5VN0gmnhTPFVjZdCoE+4L93YXKLe
         TCgtp+QuhTrLDD9YIh0GWjuL7JTfNii6kunf4OtSgk8HmMIF6HWdVlYz4j7b4tqvBSK5
         jJw264Za6O9qAJklc170psGapu8MC74GQIAv2JMfe8h+2jMUt2OsW6FuB69mMeMhDjXw
         GQdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776334924; x=1776939724;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K5mvVCNzCDCJ9t+YBPnYGHqEKpm38PDyLCEyxp+JIzM=;
        b=fv+KDW4obdSW+pIKRTyUtMU6iGmVcg1bPEOMI3SEYRLYfP1e+9BZfx/i/g6UHUq0DT
         Mh6OvB2vCglrCSDrg7W7o4kPBh5oyO+FQItxf9W44lWYWnZgOmjAKiRbThkSQfQPd66J
         TN+GA1lnQpi6FD7ukZODKECN/6+MaqIUY4q2XJcRnx7/age5ZzAAQ3XIU+bpsii4ZIba
         Qj97HbrkiPw5nQGyjhNknjV5iTrxizwaEmHX6GyZuuUUTX1ueZgy4QMH7D4elXLddRh0
         Ae+o7k0qFQEbRPLrH5i06DYHkdLizjQVgc4UsOX3PAvcFBW8YiPSR/xCJ6fdPoxKkF4f
         GZEw==
X-Forwarded-Encrypted: i=1; AFNElJ+581XKlhe7rHliDFwo5s+jxEufDKt6FOXj8roMv5hPGokrveHnYlsFTJ7Um+2r1gb6+FDLn0fK/kq5K0Piv3o=@lists.linux.dev
X-Gm-Message-State: AOJu0Yza4+J+6vWQJRGE7pJO4vMGGT255zsB1sDJT2b5XRk5yDyO990d
	ePW+1/jwzpbmF0fEJLfzzksWJn6F8rxRlYT5zkynHK9x0XJZ/4inLkqoMjQCFpxE6mbCObfOV5C
	EsRkBYNnoLrjbEvrViEimNzrTj2py6Fw=
X-Gm-Gg: AeBDiesVXUKmdS25zuyzDcVvE7oz4ESRG+Ram4nCLRH2dnRtywu8tT5RFRleodkzhUx
	N8kGVnxwwTISps64cJ+QYCQFW2OzBcD4dWuy+aNYD3F2sqG7uC00cvGbkAigFqgFOFUcEdzu8To
	bXXirBc25YV9EcnjWegc8wGZnmC9UnuIUHkUNH4bNDj2/LEca/4deBa5/XfltcjizfNz6fu02v6
	JQFgQ6Cl0laQs3ZcbNzUbKHQSLExx6v34PmfOmLnKohZdA1ItDCJtLNc5ORMrOZS5r3GfERDh5h
	wRrZNrAP/zQjhtx8QUkj
X-Received: by 2002:a05:690e:4801:b0:650:3bbf:6a60 with SMTP id
 956f58d0204a3-65198b48573mr16551396d50.37.1776334923950; Thu, 16 Apr 2026
 03:22:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260415175038.3633384-1-lgs201920130244@gmail.com>
 <CAOesGMghHi5bEcec9L6d1YUec0Cn5uEs8MrjdoT-zHSr-FJ8pQ@mail.gmail.com> <CANUHTR-XcTO4jy_TNe7tHcPPpVh_o_+-hgJtLBxN5MWupcvQ3A@mail.gmail.com>
In-Reply-To: <CANUHTR-XcTO4jy_TNe7tHcPPpVh_o_+-hgJtLBxN5MWupcvQ3A@mail.gmail.com>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Thu, 16 Apr 2026 18:21:50 +0800
X-Gm-Features: AQROBzAYeNSoPmZB5XF19vrfhLSjNH_Tgqu7gUhZJFmf8hV0D4dYm_BdoKYs0EA
Message-ID: <CANUHTR-U+DDaWCKNUcNE2yScPkk6vVfnZ=GXpGtRt6SFYph_Ew@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: fix reference leak on failed device registration
To: Olof Johansson <olof@lixom.net>
Cc: Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Olof,

Thanks.

On Thu, 16 Apr 2026 at 17:26, Guangshuo Li <lgs201920130244@gmail.com> wrote:
>
> Hi Olof,
>
> Thanks for the review.
>
> On Thu, 16 Apr 2026 at 05:47, Olof Johansson <olof@lixom.net> wrote:
> >
> >
> > This looks like slop to me. It doesn't even compile (there's no local
> > 'ret' variable in the function already).
>
> You're right, I missed declaring the local ret variable in this
> version, so it does not compile. Sorry for that mistake.
>
> > This is also a no-value fix, the chromeos_ramoops structure is static
> > data and not dynamically allocated. Please don't burden maintainers
> > with these kinds of "fixes".
> >
> >
> > -Olof
>
> My reasoning was based on the implementation of
> platform_device_register(): it calls device_initialize(), but if
> platform_device_add() fails, platform_device_register() returns the
> error directly without dropping the device reference initialized there.
> Based on that, I thought the caller might need to release that
> reference.
>
> That said, I understand your point that for this statically defined
> chromeos_ramoops device this is not a useful fix.
>
> Thanks,
> Guangshuo

We are also discussing in another similar patch whether the
better fix, if any, should be in the API/core code rather than in
individual callers:

https://patchew.org/linux/20260415174159.3625777-1-lgs201920130244@gmail.com/

Thanks,
Guangshuo
