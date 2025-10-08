Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C6228E579
	for <chrome-platform@lists.linux.dev>; Wed,  8 Oct 2025 20:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759955132; cv=none; b=hx3BpT7bsal7Ja81klNKL650aeYVUKF6GCBQUD+0K9/1tQIKJgAUBYcbCozqBpz4gmzMcTEHC6xhf3Gw6Hu2sSazTCcJ8AznDU8Sz89yB2Ymzc4jL8El73yKG92D7ZEooR6ffLFvD2NPCwF2zUosWZY4pjFPfQvypeeA9K7oUeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759955132; c=relaxed/simple;
	bh=pkF8t1F/yS30PeNW+BPwG2wyZzv9rA3CJHnyM+CBV8o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uHXbnIaPXw3TyMNe0ZMZAv6p0BzgqIT/4wpl9JL0XOL/S/atZpOzpCsin6BGL5mlslcWqXJvFr6lMipD8QTGTSonhhkjrH9V8VZqk5UUuO7Xu8AElB5lM47ze0Uw84B6/Az8uzPgSZv0865yA5K+hei8o57BfyPIRfsxYZYrjUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GpljzxKj; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GpljzxKj"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3ecde0be34eso761756f8f.1
        for <chrome-platform@lists.linux.dev>; Wed, 08 Oct 2025 13:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759955129; x=1760559929; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pkF8t1F/yS30PeNW+BPwG2wyZzv9rA3CJHnyM+CBV8o=;
        b=GpljzxKjtBB/1AFp4Osok6WQjGZOVE1C9A2+EEG4yJzV56dIzptCED7cBCASKm9/yO
         XKDUo5Rd9qWVgMoyUdrzKoYCSvPp8DgUUYlOZ6v1qwL4mqXTPuQbhDzsflpl7FeVsmct
         8UXEe9Ng5OwW9IBaxnHblF3ImcbBYvT21PacTW+9bf0ipVnlLLvIjgWF86LThXepLsOI
         3pIzYTl8DL7YOe243pPAGEIl+9ckBSIuI0QPln8a7gY5pY0IppxCaGm5W0jfmT98VU6v
         X72V2o74MJTqRdOzV6EGDJG3ePX2OrcIarFlM19SHImGGbxw7nzflMHxXPyHaU5I1vks
         8CtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759955129; x=1760559929;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pkF8t1F/yS30PeNW+BPwG2wyZzv9rA3CJHnyM+CBV8o=;
        b=kZ7FfGmuP1gJlE4VmgBAwPKSvgdwLW01ZTwxUTo6qY/Uk0iHsHVebYnNjh7lJzTGQ1
         VxLjJKnmG9PhKjyPleaXz3zmkAG69pUxZaRXTUtUj5ZrIPLCkhk9iRR79vJbHy5LYj8r
         X6McrDo3Dq7LilyOvIkSTq/Om8fXGfTwOrDhYCUaIWItAGpASb8c7S4Y/mMpgaXoMdlI
         601L5ENsUymhvLhVPxj10pi09EZAY1D6kRPpKTJpXINep0uOuvGQQ31iD2o5+E0EnCbf
         4pexVHTUBoxByFQ7HSMY8wf1EZiOq/5sZFe6T2f2NYLB/5/339Z3tB+0t2W285rSxsuN
         FGSw==
X-Forwarded-Encrypted: i=1; AJvYcCW2GI09thWmZHSaydCSi594zx+WaULUk4Cd1M8b77Nf+Yd7JvY6DyugOy0+vFjLMkVTzs+0j+dSrmGRYkcwEU0=@lists.linux.dev
X-Gm-Message-State: AOJu0YywbjW1SS817JoOyPCs7cczArulATph0/S12McFESVs7AnvPmDh
	MgO+DuEwm/pdegTw4b6LZUXgoFRUDrcGuONO/+nt6WengN+cvZ/wZV0l3Zjm3PcoL7+/bE1WDGT
	VeGBjk8O/qRwqTfEQcLB1Ck99hUQDiEn9Zwp0HVcz
X-Gm-Gg: ASbGncvFRixRBLwH0+L856UwUHi5qrug2ha5TqQ/rkBITRDShZbKjF7DfZaZlFiXQs5
	QNcCVT92Miu0TAeRNzdfgP31OxzszfGL3uEDRoEPPRX6JX8wqrf7oVbASTncM9Jaieh2lXK4ifA
	RslAnVIXwu1B9Sx8dIvEkQDVxXtbQVfORq/+PoeIQidWotefBxfT1qHaorvOox8AVe6pq3pqGqw
	TgGaW+rfVL/wC66ilTQZO4bGjo4S9mMYUYprSSksNzCgAwlUTJU0vXB0RWR5rlzXmo8zwxubap4
	zGg=
X-Google-Smtp-Source: AGHT+IE7vszNjL34ga6ZlF87FGJyCFvkLaT4QME4cTsoSkHUnw1osUy/bHfoR1cCedCCUNKAN+lPRA/JTrLq5/lblcU=
X-Received: by 2002:a05:6000:24c9:b0:3ec:42f9:953e with SMTP id
 ffacd0b85a97d-425829b0556mr6352133f8f.7.1759955128611; Wed, 08 Oct 2025
 13:25:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251001193346.1724998-1-jthies@google.com> <20251001193346.1724998-2-jthies@google.com>
 <20251008160354.GA3764744-robh@kernel.org>
In-Reply-To: <20251008160354.GA3764744-robh@kernel.org>
From: Jameson Thies <jthies@google.com>
Date: Wed, 8 Oct 2025 13:25:16 -0700
X-Gm-Features: AS18NWAXqAZMg1YTF3Xq_FAQ2QhulCuEZTvP8EM0hBHj6dvno26tVBuRXa5noQ4
Message-ID: <CAMFSARfvBQrwdeeCaBbqF++HGNyAza40usFLtAoij4Y52r64aA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: chrome: Add Cros EC UCSI driver
To: Rob Herring <robh@kernel.org>
Cc: akuchynski@chromium.org, abhishekpandit@chromium.org, krzk+dt@kernel.org, 
	bleung@chromium.org, heikki.krogerus@linux.intel.com, ukaszb@chromium.org, 
	tzungbi@kernel.org, devicetree@vger.kernel.org, 
	chrome-platform@lists.linux.dev, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> What's PDC? What's UCSI?

PDCs are "Power Delivery Controllers". It refers to an IC which
manages PD communication for a USB-C port. UCSI stands for "USB Type-C
Connector System Software Interface". It is a specification maintained
by the USB-IF which defines a standardized interface for communicating
with PDCs. I'll update the description in the v3 series to provide the
full name for both of these terms.

> This is the exact same binding as google,cros-ec-typec.yaml. Why are you
> duplicating the whole thing rather than just adding a new compatible
> string?

I separated these bindings because they are associated with separate
mutually exclusive drivers. But, I'm fine with adding this as a
compatibility string in google,cros-ec-typec.yaml and will make that
change in the v3 series.
