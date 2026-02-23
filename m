Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B403F365A11
	for <chrome-platform@lists.linux.dev>; Mon, 23 Feb 2026 12:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771849456; cv=none; b=R0a2ftQMwkbMWx1ByhzVw8dk76C6NcwLxH2IX6OQ0U/JOtIKlDB6Kow5yP8Z7usYtO16pLxbBjhKYlPuBxnQ9GeSETOerSQOwYn29juQJm8AC8RGUbcoLLqvBrsWhipEE9ERWLCk/sx5Ug5taShTMce2at8QZHcIptIgq9oyi0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771849456; c=relaxed/simple;
	bh=1TDlDOmYb+z5xkrCSTxJg2Hro4ku/GuAYlkD3H61Gms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HSPGyqjx3uKWANjZXH3p0KlV6QLcf2pHFNBVz6Dd9GC9YbAgwYhWRxLLcqig9UR7AMAcoasGMf1sSPKxgIgaBimYqnoDUd3S77bbhyNNG6k9YfUdwo++5SufnsM867o2OulMNhayB9U9kgV6YNaTFUfaOOiT/hoEFv7z1/2Rbdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=C6sT1OKr; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="C6sT1OKr"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4806f3fc50bso48428995e9.0
        for <chrome-platform@lists.linux.dev>; Mon, 23 Feb 2026 04:24:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1771849452; x=1772454252; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2yVlt+t2uIX/rNvX0LVoxha+PLrUtJBpnUZ+jxIJze4=;
        b=C6sT1OKrFBdfIPWXQvTpaOBniGeWJgTuKfM2OMcOzDKb9B2KTq2AFx1cehZiw89pIo
         GV7OrKC1yHtyRtpGwCpVGOhwcFvLzUXoN7siCTlmiwZ/rmlbFiT8unJucLNlZ+Q5eXUR
         37Fnqu0CoXAJEwkWzN4CXvO/LKvfLcKF4r7hw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771849452; x=1772454252;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2yVlt+t2uIX/rNvX0LVoxha+PLrUtJBpnUZ+jxIJze4=;
        b=Vj0uzO4dOkNobsh3lIPfaDtXgFvGgNWCVHi7HnrqkgTzEatr1MvH/9ibQdNNnArr/W
         o9DZuy3YZ7rpPlz3kmjhFzUgBJgcl8Yt39nt6PO9yDaXDfP5OllKHiYQ/JbTGFUPzgF8
         yOtnOsz4vtB+qexkxitydE6p4G2CK8N3n5BfbTGkpr2NeimAwnlo9c0I55nXON3Jyh7P
         cMj/8vMreydH+1QhTfwGZJMhn64lKgrQiVVWnGJ+BfeIa+RrwGSWvLgeDbfTJShh87+o
         3Lio0csQbqSrEIu1w+Hwx/QJhiaOvUbhA2hFCAGhSfvUCVheq6GbC6u2ScLuBThQGx3o
         aWLw==
X-Forwarded-Encrypted: i=1; AJvYcCViv1HRtF4vKpma7qkf8fHW50CLcXHROl6oePO0TM0xsVNcyI4HvQiOt0sx3t5BRUIlAnVfYeJ8prsjkzUYQks=@lists.linux.dev
X-Gm-Message-State: AOJu0YyBEUoK7wUH7Fq4oW/Ch/iwqgYq793oJUeYOh9fEREoS2rU1x+h
	q1qzGrMUXUn19FkcCG7uOZryFAWtKFAAjAVp7N+pUGi1J2iOoalcqxD+oYiixDr8iw==
X-Gm-Gg: AZuq6aKJN/TGiDxOtR1te3DVAL1lQmtEpu6cRKOJn7/SL4moE1OvIP/yf1F1MPk6N58
	jj6snENv6sKcjh0cueH4F2pmIy2Dojt8j46VDx5yuTMXP7AICi7kP/HhzNAeRHECLSZMdmk/0VI
	v1JRUfppe6Qf2egSQZtUha2zADex7SxDxWGxmP3wmM53qgjt55UrFzDdRFktHv1ILo8fd0KYYdq
	6ySNiHgIshJIaOoR1/ZllmGb43VE8T2Nv8205i49dMGBI3+tV6QQ4Q0/QuOkQ1NSDOSrBFoqv1W
	DbGi2OMib71RHHY5ci6IkHQLYeLtON26KO6BwLpZhLyjC4x4Ynlfrv+dXNRJ/PUCJofEcGH0SAE
	/X8PVRfDYJ/wT7NKmWXwIJiPUcRmJMp9L4EC0nUNPX23laOUZZRWLZ9+Xn8SKzT5NM5jDa9m34p
	CpquiHlCvN6BIgYWQYBd+USGW0w1pgqA==
X-Received: by 2002:a05:600c:3150:b0:483:b3d7:2e87 with SMTP id 5b1f17b1804b1-483b3d72f25mr32318865e9.10.1771849452025;
        Mon, 23 Feb 2026 04:24:12 -0800 (PST)
Received: from google.com ([37.228.206.31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483b57e5db1sm16094365e9.7.2026.02.23.04.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 04:24:11 -0800 (PST)
Date: Mon, 23 Feb 2026 12:24:09 +0000
From: Fabio Baltieri <fabiobaltieri@chromium.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
	Simon Glass <sjg@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-input@vger.kernel.org, chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/7] Input: cros_ec_keyb - add function key support
Message-ID: <aZxG6cJmAuAPpoi9@google.com>
References: <20260222003717.471977-1-dmitry.torokhov@gmail.com>
 <20260222003717.471977-2-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260222003717.471977-2-dmitry.torokhov@gmail.com>

On Sat, Feb 21, 2026 at 04:37:10PM -0800, Dmitry Torokhov wrote:
> From: Fabio Baltieri <fabiobaltieri@chromium.org>
> 
> Add support for handling an Fn button and sending separate keycodes for
> a subset of keys in the matrix defined in the upper half of the keymap.
> 
> Signed-off-by: Fabio Baltieri <fabiobaltieri@chromium.org>
> Reviewed-by: Simon Glass <sjg@chromium.org>
> Link: https://patch.msgid.link/20260211173421.1206478-3-fabiobaltieri@chromium.org
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Thanks, happy with the changes, gave it another run on my test setup
with the whole patchset, all looking good.

Thanks,
Fabio
