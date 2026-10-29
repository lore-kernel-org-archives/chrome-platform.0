Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793266319;
	b=My1bHdhfFn1g79BcnY4RynBKtiLnQQFS1gs4RlMewB5GesBXm6N7UksobJQgjbTxVlgM
	 qTYZhqAkjYq6lTs/6ydnemj/r+9krT8RXraBjkfrzE//vRutqaC28comTPyNIvBgSvqMn
	 jGtoSbUOVInnTLnLby1tC+a0V/2NOaypxCJlK/b2pZfZq+iv3dwrklGXAp86EE38uNk1v
	 3GwkmV+EoV8qFuUk/7/GyooHjyW8BUn35QjzJOSdyY9yeDaRzlhO5wjDTi13gIAaxWyz/
	 VQ499oBpqSk/06Xljo0vz0sDs53uwDxVBRDeKQ+RUKJqTyu128yKCfCx4v1n9IXwShg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793266319;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=ZioD+xVabIFlu6EJUI2ERb6j17tqqndkB5MsEjuJE1w=;
	b=pbsJtDQPBLDNVHhbUkIpqmbbDQWrq/lg/zE6LSxCX2HGTv787YaIy9QBF3444l4dgQQx
	 /oV8+AdP41f7Y+o13hHaDketWneYfS6/uHX49Tut1Z6P5AwxYwYMjIJyI60XQPZWXSUyq
	 8G3rH7UiZNUCkmHYNEvPVPZ5Ld24ABMZg9GiC88upy0VnYHSaFJfOmBJYmfdsR+VEO9qD
	 JvUDetXsRAODWRnLa0SEZG7gtEhUmPHZNDKk/QDRSR0uvYbh7eXJUFG/dwvMvuL/H/Rsc
	 S9joRHzxgzfitNu2cxfzlCegQvD5T7YozHCbqoMR5VTBS9n/8uiML1GVZVjDLaDwMLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--sgsatyam.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nnqVqeaA;
	arc=none smtp.remote-ip=209.85.216.71
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798DD60A2608
	for <chrome-platform@lists.linux.dev>; Thu, 29 Oct 2026 09:31:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 798DD60A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sgsatyam.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nnqVqeaA
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ac77c3ff6aso2719466a91.0
        for <chrome-platform@lists.linux.dev>; Thu, 29 Oct 2026 02:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793266319; x=1793871119; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZioD+xVabIFlu6EJUI2ERb6j17tqqndkB5MsEjuJE1w=;
        b=nnqVqeaAZQOl8hVV0zqZix63/wl+yNBaUnK6FnHsC2w6f7073cEFPFEZXsRNZr8hN2
         BOrqvZv44W+KR01mmJpjJd06TnaPF7zlEkPrmI1MD4zTouDT364DWv0PJ3jDwu3Zc4Ep
         Pc4c1910mq/GREIAv1BuwlavFJ+XUnySSswDi7LIdFD9hlXqlwYQbGIE4wKXCAHchGwj
         eAlGk5NptHwsCMR13V2XmdiLtSEquns4n76B+nKIgrZrszH7Nm0yjJ97Eiw3x8LtGwXI
         f1xNC9rKziuCfk1BEFmWLgsFmkaWbAlQ+jsGdWrP7AQ7kyErk6giv4xv4cKJ33gwCTXC
         iqgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793266319; x=1793871119;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZioD+xVabIFlu6EJUI2ERb6j17tqqndkB5MsEjuJE1w=;
        b=0B5LzwG95sHQ6/GY6xxivzIfZdBFF8Kefr2/zwzhvIKo5eB5namSNbY4iImGPUqhZ2
         cjuVscDUV5iLu6bEXFPK8WD6ft77ylSW1uZFaBY4bt6IM2/LGVxD4I9DFQATCChhCIl3
         Hc3eKe68ROKc+NJoQzB14IBYbZkIWv65Wk7O6oYZwu2uhV56XNVMYadnX81mtn7CHTvT
         QqB4op4YldqllJ6v18KdQ6quqTdfV2J9PCT0NO5o0Wbmsd8wMBacNVT47wblzk3FGrdk
         N76Gn2axxqKQbpENF415h7P1CYoMD+9w+QAm5FaIBqOPtxmuuqZsXmN8Nw8oCK3tts1R
         Vzmg==
X-Forwarded-Encrypted: i=1; AKwUvBzboYuJx4SyjpRX/Fw4Ixn4I5BB5FiC2WOkknk9xXzX5AYOBVzts+twHCZba4BHsGw2m5CKQpdsCrRi1D/nrDE=@lists.linux.dev
X-Gm-Message-State: AFq9FYLCMBtung4PuxW3lTaFh97qhl22A3H+l6hLjUN36J38U3MB7xEf
	kzw6aYOE0rAqvm2f74JKuGDu7YF0Fy8bFtpqkMO1nnLfTkeLkkEkWn+lv8Fy1gtkwbYidESajBS
	6KR2NM6Q6b5uE5g==
X-Received: from pjlm17.prod.google.com ([2002:a17:90a:7f91:b0:3a7:e2d8:4f4c])
 (user=sgsatyam job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:3882:b0:3ab:5832:727d with SMTP id 98e67ed59e1d1-3ae58287728mr3874401a91.35.1793266318623;
 Thu, 29 Oct 2026 02:31:58 -0700 (PDT)
Date: Thu, 29 Oct 2026 09:31:54 +0000
In-Reply-To: <atbEIOCk16-Z15Kf@google.com>
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Post: <mailto:chrome-platform@lists.linux.dev>
List-Help: <mailto:chrome-platform+help@lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
List-Owner: <mailto:chrome-platform+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261014074306.2500909-1-sgsatyam@google.com> <atbEIOCk16-Z15Kf@google.com>
X-Mailer: git-send-email 2.56.0.313.g2479322e68-goog
Message-ID: <20261029093154.1572188-1-sgsatyam@google.com>
Subject: Re: [PATCH v5 0/6] platform/chrome: cros_ec_sensorhub: Timestamp wrap
 and drift filter fixes
From: Satyam Gupta <sgsatyam@google.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Satyam Gupta <sgsatyam@google.com>, Scott Collyer <scollyer@google.com>, 
	Benson Leung <bleung@chromium.org>, Gwendal Grignou <gwendal@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 20, 2026 at 01:30:11AM +0000, Tzung-Bi Shih wrote:
> It seems the issues raised on v4 haven't been addressed.  I'll stop
> reviewing v5.

Sorry about that, I missed your review of v4 [1] when preparing v5.
v6 [2] addresses all of it:

- Fixed the MAX_M unit mismatch. Measuring the actual drift showed about
  2900 PPM between the AP and a standalone EC (MediaTek) and about 20 PPM
  for the Intel ISH, so v6 keeps a 5000 PPM limit, now converted
  correctly.
- Dropped "m = 0" and used -dx instead of abs(dx).
- Reset batch_state[].last_len when dropping a sample.

v6 also reworks "Fix AP/EC TS wrap". While testing I found that the v5
approach could still unwrap the sample and interrupt timestamps to
different overflow periods, so the sample timestamp is now derived from
the interrupt timestamp (patches 1 and 2).

[1] https://lore.kernel.org/all/as8mAFOdk7wgNqVd@google.com/
[2] https://lore.kernel.org/all/20261029092846.1567475-1-sgsatyam@google.com/

Best regards,
Satyam Gupta
