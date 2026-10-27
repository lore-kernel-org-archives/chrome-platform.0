Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793113761;
	b=ZW98bjEqj5mMM82Fffx3nQnEvMXGyOV1Qo/UHFpdznG0uaZhq1OVg3vOoeLumh4SXYMb
	 WC24RTIF7hLprb5FfHVRwsHFl0YfJuwNrRTC13AJ2fGQu/YpIlkmCVYvENGhKYgPZ+NAk
	 QH1lFhydzF6KRiOLBqVxVEnX/FIqyDEZ3fHW78EfLVwO/yyAtqg484yfPqyuLH7gAPiU8
	 fsStyoc6sI7vxBK5UpIXd44g/wIuJVzQ07s03hiUjgzerFLe1tVxJM8mHk4RGUe0HG8z5
	 pp43H89NzwjgUsw86cw8erOmp5AtaR6darSHXykxBYvzCsqGUkpH8n5z1uaXhbdsFyg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793113761;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=oAHxKAOEiqLhGsEJj6uWGojbuVaoZYDv1iJ7mHdZGsA=;
	b=uEv3hbljUoJZWg1AQaWBQa97WlYOAuARjXtOqWbNYsJ3XS3gAIghEMnAoHfTRV+VKN2F
	 xRLwsebz9A8AsS/Z3OEYzEKbzt3FJ29PlbfaPO7hOJbrQDKL0HeFuxgwrs99FxLwIKFQe
	 wD5N2BcyXbCqaA586XbJOjw44ICpK7oQnZXKQtxI2yxyXkAfFZg+Y1fj5c33WdCteuktU
	 CR5i8y9lLqXOk5FBYUoNOtVIKJKmPgBuLTVCQLrh5q2EGFkXULywIg8tlvh7OBMUA6l1d
	 spJY6nCaOOA6y7r7K+k3iVI3fQVsTLzcAJSIn+zYcBI+mtWG3b1azhWXGd3QLgYIOFg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KPVmGfvy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17AF0606A320
	for <chrome-platform@lists.linux.dev>; Tue, 27 Oct 2026 15:09:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17AF0606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KPVmGfvy
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3535a54bed9so6545090eec.1
        for <chrome-platform@lists.linux.dev>; Tue, 27 Oct 2026 08:09:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793113760; cv=none;
        d=google.com; s=arc-20260327;
        b=CDoFeY349VLgWNaVrgjVNS7JeRnwrvd3RSG9FrxI4FKew2xWiqyp9iP24WgE6xRh88
         cWOgUSpASm86jFF2mQtWc+GhFZzBjVIVk7KE32ynILtoEfaqshxPM0hl/ZkojUT60TKe
         oIL9AI0ZVuqP1TUMRSCA1orm1fobGnwbNDWQdOScE1hWydWgL5V/oMg2ysEFaCBDFM4T
         aVbG/cmLiwEDjcZgzrKZz1myRtP7EDhGLEfds19ZVcGRClkYLaLUvwqoFQlAvyFGEYaD
         2K2BCJFFuQwLmWuRDW4fq/WvQtxyBAifpVkwZ/VrjrYU/lrRTI5Zh+CUC8s4l9fKptbI
         2Y8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=oAHxKAOEiqLhGsEJj6uWGojbuVaoZYDv1iJ7mHdZGsA=;
        fh=SuapOEElCU8n/t1qxPAeAv4/FBJHnub8mXXCbcibGt8=;
        b=bBsUtn0lSVgHHN0HOlfD8QD8o81e3XkoKl+AfJyejJnKbJMUcCgKub1e4WPuPz6We5
         kvCBZRI0WNF2iion66JUtMweIWr45VI0G7Cg6dioq/ufnJcPxN8TDwENwN6sjvVMaQOL
         Hl/XH71rseikmoXEKkxlfIda8l7Ku7opT9H5IFgShmdwyLKN0hzz7kCVP93PStasDDAb
         4oMnAanfDAjJ15mXo8rcR2/6uys68MFByMuJCXLi0U716yMbwr9jB+G4+7UZFvcnDLwb
         E34mIGclZqF+7bRmtaOZlWOuiVrZMlt0fZtUJV2pph245hDruhyD+Q/5fS72P37NACQ7
         o0Cw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793113760; x=1793718560; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oAHxKAOEiqLhGsEJj6uWGojbuVaoZYDv1iJ7mHdZGsA=;
        b=KPVmGfvyBj/Dzk5suQcJJLTmdMZoFklKSTzLrO+kVGIyTT3420vxvndTMaqNu+d3x7
         Sf+BdzbvasmfpxI08a++7dM61SW+yXqA3ZvmAa9KHQ1aGdkZyEAlDVGo/pyBh5JzGQPe
         kionkZILdOuczhL3aJcMB06LQ9yttfyGm/+gaEW2Q3dF9vtU20fzez+8QgDh2zzgEbQU
         5QMheCvoEeJtlntQ3yzXmpK5Dzu0pyE7jmLwpTiNj50qMnDa7XZDADuiZpDzPcFjMPeS
         9/AkfjrWsG4qYlA5Fk6kAJa5HQs/QKWheZl+vWczIqTPzkJI1ikGSXLF/RuU/gt2du3C
         lxtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793113760; x=1793718560;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oAHxKAOEiqLhGsEJj6uWGojbuVaoZYDv1iJ7mHdZGsA=;
        b=RAMdUrRd8fFke6AFLbb8YBqx0gno0r5xbQdU8XuEF2za5CT50NnjATtljbs5rRMPuT
         hcYio4Y0vHx9VhR7GLI6qL8OhPzAizgA21ccWneiZRGQ7V/XaOai7hrVK89KGuIWGAju
         Zu/mPy4MotclRPy5FbuJNEDhIjzRvZKg2r70OoW1+YXfkwDYKxFDnU0WAXcxIALBlSn9
         +ZaXL3J1+/8RGT2AkuzuhzmvNKe7uNGPTD5SDOOuq90p0dGp5e0VZOkmf15xogcl07Jm
         iOZ+NgiSPqfKbi0iEVnAw9TGkBpM72Ixo/m/fqnn7972Dka6ZVrJRqShWwDi7kO1iUao
         aMog==
X-Forwarded-Encrypted: i=1; AKwUvByKjTjyk2WJ67JUasuYSPQcX+3TEWniY8vOA23oKcW/5PBv+7X3KGNtB3nBIvyJWbNqx3Dmvt1Owl4dkwhX80o=@lists.linux.dev
X-Gm-Message-State: AFq9FYLJEFZBkaAzlmvGJm8se9Sit87SZ+wRsZGTc8gyeFYJZR1BmSi1
	uRZB/3SFHK4i3l/mlKAiJnrUrvFWZNyUINSrH8clyASuADJ0NEO3lX5cBH51CeSfY3vo8Pxf07j
	+zyHD6c82vh09qRafpMH4zxP+HwQ3egI=
X-Gm-Gg: AYBFou2Jv3rCxJ9QhJ1P6YNx5km44xz/sSp7EW5IFyHvXRCPTU1tEt4QTYFs9DEWkU8
	6AzC4QwVXwkdnee9xe7JqfhzF5scTPC/1QWkoBevGh2jgzcUyTNWdN6OWl8cojU8OvDZ0O019v4
	e9tJRU/7NKv+/sA1bR/6kEr1pcw7Kis110vFKy6IrVo3leVBx5hzC5WTbavJJnHi2GMym1IEI1X
	wtksDWV/xPrZPG8K7WNhMeASQA30SlOBVPc6wk++PyAxogBqyY5kIQ5RK6mmzyZBj+4pW9XRVmi
	nT9QS2TgRyBVJRvSXW230yc38orf5xR/XQhTUUfl3RpuAwRO3agYJxxlFdEsGWVYAJDvTWZdNXs
	r8PzrN6ExgwxTsa7ibXy7mhkGQbLwGdpxczB2EWYCSeZA9K0URhBwOP4468p/Qsi9nJCJN48SKL
	G4q+V5ABRm5OFFEgeTiMX06WS+BQQvWIwDxIXlzahcyTBctpb9ay7IJw==
X-Received: by 2002:a05:7300:e024:b0:36a:158e:f917 with SMTP id
 5a478bee46e88-36a158f021emr2604437eec.6.1793113760079; Tue, 27 Oct 2026
 08:09:20 -0700 (PDT)
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Post: <mailto:chrome-platform@lists.linux.dev>
List-Help: <mailto:chrome-platform+help@lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
List-Owner: <mailto:chrome-platform+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261027124954.110697-1-zoone.rupert@gmail.com> <20261027124954.110697-10-zoone.rupert@gmail.com>
In-Reply-To: <20261027124954.110697-10-zoone.rupert@gmail.com>
From: Kim Jinseob <kimjinseob88@gmail.com>
Date: Wed, 28 Oct 2026 00:09:08 +0900
X-Gm-Features: AclHuK8H6vSFxFswuEXecNS4oxgF2wzBLnY17J5ZgNNydJKg-55kp3rBfAwA1Kg
Message-ID: <CALMSew+nhZp9BoqS5tOgFdiVy13U1r2f4UQa9Sd5zc9pSt_YcA@mail.gmail.com>
Subject: Re: [PATCH v4 9/9] iio: enable context analysis for all drivers
To: Rupesh Majhi <zoone.rupert@gmail.com>
Cc: Alex Lanzano <lanzano.alex@gmail.com>, Andy Shevchenko <andy@kernel.org>, 
	Benson Leung <bleung@chromium.org>, David Lechner <dlechner@baylibre.com>, 
	Guenter Roeck <groeck@chromium.org>, Jagath Jog J <jagathjog1996@gmail.com>, 
	Javier Carrasco <javier.carrasco.cruz@gmail.com>, 
	Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Jonathan Cameron <jic23@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Matti Vaittinen <mazziesaccount@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Remi Buisson <remi.buisson@tdk.com>, chrome-platform@lists.linux.dev, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Marco Elver <elver@google.com>, 
	Bart Van Assche <bvanassche@acm.org>
Content-Type: text/plain; charset="UTF-8"

I independently build-tested the full v4 series (1/9 through 9/9) on
top of jic23/iio.git testing at 7d80b4b383bc, using Clang 24.0.0git
with context analysis enabled and W=1.

Results:

  - x86_64 OSF: 5/5 translation units built, 0 warnings/errors.

  - ARM64 OSF: 5/5 translation units built, 0 warnings/errors.

  - x86_64 allmodconfig-based IIO: 723/723 selected translation units
built, 0 warnings/errors.

As a control, enabling context analysis with 9/9 alone reproduced 256
warnings and 2 errors. Applying the complete series eliminated these
diagnostics, including an OSF warning resolved by the conditional mode
claim annotation in 2/9.

Testing covered compilation and static context analysis only. Final
module linking, module loading and runtime/hardware testing were not
performed.

Tested-by: Jinseob Kim kimjinseob88@gmail.com
