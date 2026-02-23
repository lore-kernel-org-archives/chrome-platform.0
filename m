Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C9932192F9
	for <chrome-platform@lists.linux.dev>; Mon, 23 Feb 2026 03:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771818599; cv=none; b=XAZ2kz7GLVboR0QacncpMp7KJVWuewPrbeXaONNTzw/XlhtOa9+q06dyWhB96Obxba2FPv0+rqNFzD+H2f8eWJ9/bOERCEo22kEAgYOUeMrugZNY770vBxGIjiPiuAJ9TJ9adcqYoG9Z4jxFvTzS/Mxh9MKV7SNNQzCflrPNtoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771818599; c=relaxed/simple;
	bh=DH3MlKBo8OepM5KCx3hb0qCHe0GY1i5bgyS+qzKnpUc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EnpNkoPXXwUqAHgL/ntLH6pBGBQ6wsrd84FADRD41CumRYNykSctcyUelZw15//N12skY8orXqE8cUnjVRbbqAeQrqxl5gdGGie3M2J+4v0OUTAnqwo1GVSR2WrXKt3QjR8bAGvgQW5jEP61LvblirEDzCUVWhd9SLLQ0IKb2GQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EL12JdDb; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EL12JdDb"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-12758ce1e8dso1032650c88.0
        for <chrome-platform@lists.linux.dev>; Sun, 22 Feb 2026 19:49:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771818597; x=1772423397; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yPs2RWVwVls5m0dIdxfZah4HJgj117r2pISP+fJO5+A=;
        b=EL12JdDbA2S4oh6LpT2h1BkylbFO9jQjvjANNBEQ43RVgCdnlAx87Q1rQQtPiLIrR3
         QvNIzYMrxpBzqvtxd5KbfwFZ9MpVSXAKcc0Eju4zsz8civ5+lj/9SBMbeQAk8iq5NZuX
         IJyX9FP8FFrl60Qd/Rx1LaY5bfZ6pS9YVvJ2So7KtH8et8Dw3KLGPMc4ZaRe0gJzEG3h
         wLJBrBpc/eaSrn4Z8lfgs19kKD1npPI5C02xnhJBfryPxbrL/tvLWFeGWSRVofwjMQGQ
         luLZSE+RXufFXrOSHrpOyZQC/jImHuSSoyLYXa90zdsYShkyKtYlZiS8I2G4hh7/h1eX
         KxCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771818597; x=1772423397;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yPs2RWVwVls5m0dIdxfZah4HJgj117r2pISP+fJO5+A=;
        b=bGJXMks/LPW8wRnTq4o/9G4/clkjj//PuSC+IRCTU9hGvcV3+RCt9f8Efvn4Za4Whd
         q/8mkov4zJDQI6Og4f3fZaN0PsUcdwu3+SpTSOaHGp1F/8rxXXp2pgVjf5kuuBGQKLFo
         W//5TdOxvfyIlAJ8cb4LWk0kMHGD/6jjE0B4HAG93Z1NSjLGwYjCWNeqouOj+ICAscKc
         Uv5eqcL5u/Wl9i/9Z4ukfRqsp6QIZjEbCIvda+mMbJ74kq3+1UzwDT4Tbc8Ugc68rQxC
         VvkdC+K+70KqRmGLtrqQtc2aH9nMxBQsCXVnX4+s0sge0MCMwOcB+NkbKw5T/B84upYJ
         xwug==
X-Forwarded-Encrypted: i=1; AJvYcCXo9xfdVEhAOj8gqi3lK/cXTQnik3X2J+1rR+an4wk8un2MMFl2oMffMJQVoB1jY45Ki51zCUqejFoCjA00OsA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx7qUQRP8LRFzKEvsa7pFrf/IZhkgbLOManip7jhaVFGToJSnui
	6d9b0ItCfWKIRnJ3gfaACPpSdVpJtEw5vjH0Zi3b7FJ44Ekj7th0U3dC
X-Gm-Gg: ATEYQzyc6eseM/NN7s9RsQtqIHQvf0MPu3gJMws80afCZDDJ67BA1diVsi6GYSQqraq
	v+EiR37N6eZU+QHiH3P+2wdw+9BfWx1Ae+8+ed7nrLjkIF9H8SBQ53sF5qCZ04xz1DszIN5j63P
	scFYKjj1KtbKhHyChZJaqxzRroJXNK1xjgSHGlXlGaERLKv2l/a4+9lxqsONylxaHQunlf4K6Mn
	mBcYjS/QXLegz8oP5TWBwhOAUAPxP9VDcuZaeqKGXdexV3u3eRblAGw4JNlNkruA7kENLtVeEYc
	h0GXmzI7SnIF/bwk7wpgB5oRTDB3qJpMm+hYUPHmXU7laFd9RX3htIryc3aGggnahlZr9jXlva/
	nfnvnV48LC5Iosg5fGH/dceRFmxPyjZbWUV0WUpljhh4RvJHpwP+c3kj2XK6fGB0ygm8VXu/sD8
	X1n64cZ3GGVkSD8r7aLspEv8vaM3ePFxbHVmmDYlmdT88Io9DD+5ZEXM53rAyn2x0=
X-Received: by 2002:a05:7300:2327:b0:2ba:7dfa:c81c with SMTP id 5a478bee46e88-2bd7bd3b0femr3958909eec.30.1771818597325;
        Sun, 22 Feb 2026 19:49:57 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:c6c:6cca:170e:c77b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bd7daa3d77sm4068344eec.13.2026.02.22.19.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 19:49:57 -0800 (PST)
Date: Sun, 22 Feb 2026 19:49:54 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Fabio Baltieri <fabiobaltieri@chromium.org>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Simon Glass <sjg@chromium.org>, linux-input@vger.kernel.org, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/7] Input: cros_ec_keyb - simplify cros_ec_keyb_work()
Message-ID: <aZvOVKUkPBinrSvm@google.com>
References: <20260222003717.471977-1-dmitry.torokhov@gmail.com>
 <20260222003717.471977-5-dmitry.torokhov@gmail.com>
 <aZre0qH8rMcSJsa6@tzungbi-laptop>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZre0qH8rMcSJsa6@tzungbi-laptop>

On Sun, Feb 22, 2026 at 06:47:46PM +0800, Tzung-Bi Shih wrote:
> On Sat, Feb 21, 2026 at 04:37:13PM -0800, Dmitry Torokhov wrote:
> > @@ -376,12 +378,10 @@ static int cros_ec_keyb_work(struct notifier_block *nb,
> >  		pm_wakeup_event(ckdev->dev, 0);
> >  
> >  		if (ckdev->ec->event_data.event_type == EC_MKBP_EVENT_BUTTON) {
> 
> This can also be simplified: `event_data->event_type`.

Indeed, will update.

Thanks.

-- 
Dmitry
