Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793986910;
	b=CBsW1BOAvRDs6F3nMCmdCtRrtBMtqx8aiJE7nQ/+yHD1BeS7H/yh+chf7Xx/+mcBasY9
	 dSO5QNNn9GJK9FxFzygYJDdTwaPg1Fy65VRWdHGDHYJQRkyiuq/IpXpTNHqLL5djrUnt0
	 9QfMJeMa5sJz42Nm6S0XcehbQlNUF+dhO0IOS3uvupQHoWPi2DWmO5pSW1IjZAJTA4nk9
	 J7MTyp2zj8CxaD38BypEaW8Wn0IV60k3wJ/EXcn1agmzdGuV+xM+xLnNjFz83nLd6DIOc
	 Jlgn8mK5aIahGJuvMOTSdoJ8qC1Q6PFIFLozhwNUC9z/L5yQ+8YUhtqEnAQwQNH6B9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793986910;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=NbvnOhYR3ZfcLZphPp6VAqzXuqxR3rkqGX+oafzOp3g=;
	b=kKfQHEUlohM92C6pH2o1umDdCimXCV+ODE9qzCg9LQFHsZtlwSxQUhJqiB93mcoVAjLw
	 fxI9qk2p7zp6nCOjOSDYNAdWPGcliuJTwS0Qq1iADNkGkxHxFMQVhPjWn7lTQaIvvneax
	 bKMdv//LnU6E2DGOVAKXn9bw6orj8z5TNoQ5rQo4TSXrF3xPEOcTiIPcuYbOeARh2sO2h
	 g9CNbltl4U2mumkj+dRnNO2wPP70fHb2WJQCqgOJadamy7njg7y2r1EPAldKkCc174Mfx
	 CIH89eO7+VmgaIf++SVbRMyxJBa9rf5vtwgLbXx4YQ0t4XMYfJXNbNCNzDp/nGOm0kA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--sgsatyam.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="Mg6/03JE";
	arc=none smtp.remote-ip=209.85.214.199
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2BB0606A337
	for <chrome-platform@lists.linux.dev>; Fri,  6 Nov 2026 17:41:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2BB0606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sgsatyam.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Mg6/03JE
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e9d52f684fso8355145ad.2
        for <chrome-platform@lists.linux.dev>; Fri, 06 Nov 2026 09:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793986909; x=1794591709; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NbvnOhYR3ZfcLZphPp6VAqzXuqxR3rkqGX+oafzOp3g=;
        b=Mg6/03JEyj18Q9cpjq+2sYP0pNBZlz58Cn4Vp1QVkkGt3JvkxovclMToDZJtRGj2ud
         0pdj6PrYc3Du5LK9k4fNbI/cUBwX1qRNGoP1d21dmF+3TYIt8MnjwkF0N8SugCQdOgff
         D/PB/SkpNfbDCYZHHlpemDwOyeLU5pZWrMVFox4zmQAZnwVn1HM15hVVv/NCrSJII2/i
         tXig6K7c38Tqrb2OADSort/Cs9j6HWYxJ5p4Txcw7pO4Ap4csvxiGlXgm1V4Wj9MbCRy
         W8sKxHSR/vovgYe6e3DJpr0iXn+94TMUK9PaghBDpqhSSPSulVx1iyq7LNFatQ2qCqDO
         50+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793986909; x=1794591709;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NbvnOhYR3ZfcLZphPp6VAqzXuqxR3rkqGX+oafzOp3g=;
        b=zp0553ZEA074K8EpdIyPEad0ElquqqVr9nUPghWnKJ57psTRI/MVLo7oIGmOvn+8Ky
         WfE5FhElFLiJLWDfEiDlMNYuXb8JetgL8DS1bEEapKbZ+wrM1+FPrepu6AooyNerxc31
         8xvBFQu4AZAsAP/l3D5cn8L7ATGPcXVLanex8VjgNH93LwObMc4ikTPYPNSS8nWbkKtU
         t6HB3PZxOUuc6qjLmGzo7ne5S93mo1SQFWg8K4cXZYnJXK8KCwfTljg3WH7bo6G9oReo
         F+sPsppVZX28eAhQmeWJf3oeZfeUW/Hx9eMQxu/nRTsd5xs3fq3/ZQ/kRN1fASuXDSGt
         YowA==
X-Forwarded-Encrypted: i=1; AL+hErFphcEkKstTBBZfYjQ/K6aRdf3BuRIdDl0oAg9uIZny1AdZG5Tjr0HPBzMPqqKDF6PPaVp66605ctS91NrBtGc=@lists.linux.dev
X-Gm-Message-State: APuU4Z8OzhTkBWni+R7hY+CUEB5o9OQkXHGuWSe6lr+lQ3r1NxsSdZLT
	8b9LosKKeVHYQ0HIJNemdoS4rOmagp+u7ECEY13XIMYHMboSbN7YfEObxjzCBF7DYIRu4m+cAl4
	10d40J5hfQCRG6w==
X-Received: from plnu5.prod.google.com ([2002:a17:903:1a45:b0:2e1:326b:da73])
 (user=sgsatyam job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:d58d:b0:2ed:128f:73fa with SMTP id d9443c01a7336-2ed40ddeb74mr41588915ad.46.1793986909095;
 Fri, 06 Nov 2026 09:41:49 -0800 (PST)
Date: Fri,  6 Nov 2026 17:41:47 +0000
In-Reply-To: <20261106102217.3bd67592@systembl0wer>
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Post: <mailto:chrome-platform@lists.linux.dev>
List-Help: <mailto:chrome-platform+help@lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
List-Owner: <mailto:chrome-platform+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261105073107.172121-1-sgsatyam@google.com> <20261105132057.2429385-1-sgsatyam@google.com>
 <au1FF5K9EALuqnNR@google.com> <20261106071904.142937-1-sgsatyam@google.com> <20261106102217.3bd67592@systembl0wer>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261106174147.1351648-1-sgsatyam@google.com>
Subject: Re: [PATCH v3] iio: cros_ec: Use platform sensor_num to unregister
 FIFO callback
From: Satyam Gupta <sgsatyam@google.com>
To: Joshua Crofts <crofts@kernel.org>
Cc: Satyam Gupta <sgsatyam@google.com>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, "=?UTF-8?q?Nuno=20S=C3=A1?=" <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, Enric Balletbo i Serra <eballetbo@kernel.org>, linux-iio@vger.kernel.org, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 6 Nov 2026 10:22:17 +0100, Joshua Crofts wrote:
> No, don't send a new version of a patch as a reply to the
> previous version, it may break tooling like b4 for example.

Got it, thanks for pointing that out. I will make sure future revisions
start a new thread instead of using --in-reply-to.

Thanks,
Satyam
