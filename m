Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=74.125.82.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793121728;
	b=sI49HTZbSoNyBqZBcsIXi+X/+H2ugBSm9kNdX29GKtUiC9AP8BE/MWF+wtLaTK3Ycl7u
	 OmBE1UoL8L7yZ3K/DMoGUz0GZHtzFcKB2yOxSbB6DGKvm0GbUx2VKOW9yRtjDemETFZ5/
	 fNKfhINe2U6QaITCyHXIqQZ1iaywj0ufbjMWmBPFksC3nlw1QNCf+R2XZy2hiXHSkFeTN
	 l84/fnwHt3qW8wBZdOqcWA1dDHHKF1N+5rIMsx7MhqGFnwKtckv7MTt+o+8yEeBC5q37Y
	 xm27+d2b3NKfnD4ecrZUDMbf9OHtNTB8Hd26dHRcU9MHiX7k9vUiKtd9va+6ZMmNQ7w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793121728;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=sCMHExecnr7EVku3xKOnADgdNnCumi8ICt8RRfPLFyc=;
	b=xqe+KF/OfABEKfmtEuUSlJmxePTkpKOivXMvrlBBxUruymoEY5E0VZ1DIbX5xVnYRmZ4
	 7RwXVATXOgW0lRPFwSzrViKUk0SloJLcOvRo9LS9HX3BG7IGwK8VJqbv8omYIZzqZ6Z1I
	 Tasq92kpKCngHARYt+CZnP5MMZW2G1V+aHRhlEuDMc3wD4uofPoJkyjqCz28z1hYplN9K
	 A/ucDP+lPSMAgmdVPEmSEeNmVuXazCOUiilBWA2JDex79k9sukY+2802HRPLE3zdwuceW
	 xreSM3B6XvlFEPmKAqsiTVCLckvujTwsXT/ATXa9WP9nGwZ3Zz7z95lXV8lmzEfXkFw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=HwQWmqVX;
	arc=fail smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E457606A320
	for <chrome-platform@lists.linux.dev>; Tue, 27 Oct 2026 17:22:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E457606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=HwQWmqVX
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-157fe9d771bso60524c88.0
        for <chrome-platform@lists.linux.dev>; Tue, 27 Oct 2026 10:22:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793121727; cv=none;
        d=google.com; s=arc-20260327;
        b=fO5HH0mbBAd6q7S9772Fc3hAAaFjb7kaNszZo8O5IeEJVkmcW+gamc4btPwXlnvzbg
         Lpev8CGqHRDVo4BX//C+znMhaZRo49+Z9uu7p7tBQ+I3PRWViwKGyCgU7Rzo00AB1CdY
         YlJRJjuRRK/oagSjnnFs1tx3ZDjjCeK8XgzWcIVrtZGVzbtWAYBYDPHA2LRokNl2ZiN5
         g6U5hhSoXxkHUMapI/bLrYYmSM2IqDAyWNLCO+tnvUfoP6T+zNM/8Ik1BCekWI7kjAhe
         Nl0B1RHpqjUctGuQK83i+y5CTFxnKglNZXsYPDtDFcCyX0jsL8Sya9WVlGOLz1Opyf5h
         UljA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=sCMHExecnr7EVku3xKOnADgdNnCumi8ICt8RRfPLFyc=;
        fh=CaJBZv2PAG12d/yOfWxLDh8B1n50wRBe4LyAzICg9cU=;
        b=TkHEi3sXL4ldu6g4jbb8WKMYOS02pNvLD09JbpvpslfiKIRuJwjTnEg/eMPyleviw2
         ArYT4CRZg6IQlA3RI6qkftdTA8uBjbwjiJuLwYkFs61Kpn9IA1lq+NubO2GZZpYIe414
         xxEYlPdQa+wZZ9dGHFI5dSDjwDdZpmvzLPnsBxbTT2g1q7jWXn0GLLsr1e2bpdBI/0HG
         4AZpwXXklUtjpDymNidYBqSJjU/2DoQvvTAMJaoHdfcsBJ2CKBKQCUdUUUtkvUiVQJ/J
         Y31Bu9boETfjvEduGde4cRJStr2DTtqucqKfI4JAmJJeanwQ/ptPbwmG6AA1co+BJM5Y
         th6A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793121727; x=1793726527; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sCMHExecnr7EVku3xKOnADgdNnCumi8ICt8RRfPLFyc=;
        b=HwQWmqVXifld34EPuSFay/kJAFmNSoj3tZmfz1zCMNIXrjA/Nnnucap4ynm/mEOqRC
         Yq7m+rMSLB2RlpkRb1Lj3jy2h+toU4646x22NChIzZvfYVB4HksfFVtm//36KBLfrnX6
         Pm6nfsQXKgWoL7uWZ068z5+rnBZtAuKq3OljOh3tqtAj/cbRCcozeV64OeGTSTCHATep
         mvxukW4LgyjCINw2G8NiUGcPhAG5qBMucDWA9eeUSW3FIo7ahfMll2koVI2B0YRJ5I+u
         04E+5qRss+CXk8JuiFKvF6FObEkqlxxszqtw7wXclWh9aUFLg5B35MwkcVwNRGG9IA26
         fF2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793121727; x=1793726527;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sCMHExecnr7EVku3xKOnADgdNnCumi8ICt8RRfPLFyc=;
        b=cvYU+w6uD7Up6WVh8bVz/92UkqFdFsQi6R0s21W02rlprXjgyePOJjTeoAhLxm0ut6
         udFD8Ay+rkg5hiGvyyCYODzrHq61VmZ0oaxTvGlyW6/7eeaJCf8yvi9wIjMiaX04dXPH
         iN4tn30NHjb38dfEqtfUkooQ7mc/377QIpg1v0tSEJJVCu/meHuCoLAsk4+a6mYSU8uS
         s34r9oBeCLbDZCATZSR9diM31yzQmwkqojK4zyaeGB3Nflyz0FOEmnJFS1Z4bUo+r1+F
         qRX7gvt25B1BnypoT8XtwAcgRl/a7YY/Bvw8jcGB5qJdOia9IM7MO2ayK9IvxfuG5No7
         K61w==
X-Forwarded-Encrypted: i=1; AKwUvBxYY0w1U/EXNi7FAYHrZX3RDXLPz5W7AH1RfpCwsEPA4/f9VJvK/DmszaMczkEPpz+KPU8xR97BvRF+gK+05Ww=@lists.linux.dev
X-Gm-Message-State: AFq9FYLsrlMEudqbq0egnm3Qms/i/cfw2gkWpcZrAy+CvNOgDSf3Jq3s
	zxBhlbp0ekC4zlXBb+tKbWVxcQAzyECvDJnM9Nl9IoSRYm6z6FLiAA+ZNFgBL5j8bX7OoCn+wuo
	BLFL0rymxjeDGFQKYYhx9qQQ3cBkNx3f3qZOZoKcv
X-Gm-Gg: AYBFou2X3n6WD8Cw+w8hhAfq02Qc2NSxbpcqLgf60f1EasenPXbL+DiCLVkjvye4XSr
	IJIFpbLjHt9j+iasBm37xtPTFMa1SUtj1ikoqgq4cwS2UowtrFRkIV5kCCpcKK9oOfH+O9r+RfW
	76DlAGZiyP0Zc6x8S26hkqRfsp1CRqNBEZZ4dp8OufLJBYVNP/sZmAaHyw5QxWAieJMCbaVf5OF
	9v5eo6h+mGjPyRBJYok8TW++0UV2SJUxnd5K3DAg0G8uuVMA6XMzntern3Dp9SR4k8AH+RtWcj0
	zNDt7dOyjt9c1y9s0vrZtYslDCVZFhNVBClHG6KwR3F1QkeLcJdpy07rQRXHhISybhY6dLs+d46
	9Ioba/puHBG05+x9Bv0FlIdY4LP/w2b4yUvF2BEoZGEM2B9TtZGhErUbWxmigYlw4UxZzlZ+iD8
	SNObjMkAlKou0=
X-Received: by 2002:a05:701b:2311:b0:16a:8ffd:4977 with SMTP id
 a92af1059eb24-199363a356emr13049111c88.17.1793121726447; Tue, 27 Oct 2026
 10:22:06 -0700 (PDT)
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Post: <mailto:chrome-platform@lists.linux.dev>
List-Help: <mailto:chrome-platform+help@lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
List-Owner: <mailto:chrome-platform+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261027124954.110697-1-zoone.rupert@gmail.com>
 <20261027124954.110697-10-zoone.rupert@gmail.com> <auDNzWMPy0VQcazt@ashevche-desk.local>
In-Reply-To: <auDNzWMPy0VQcazt@ashevche-desk.local>
From: Marco Elver <elver@google.com>
Date: Tue, 27 Oct 2026 18:21:29 +0100
X-Gm-Features: AclHuK8orvmEUb-f7W0Au_t0jJZW6yeRJKoPRMRQ-D7ejg8oB9UAKvhykKBG7IM
Message-ID: <CANpmjNNNw3Ont87-Uqo_j4YrPbamHLue=EAMkc+B66Q_yywQ9A@mail.gmail.com>
Subject: Re: [PATCH v4 9/9] iio: enable context analysis for all drivers
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Rupesh Majhi <zoone.rupert@gmail.com>, Alex Lanzano <lanzano.alex@gmail.com>, 
	Andy Shevchenko <andy@kernel.org>, Benson Leung <bleung@chromium.org>, 
	David Lechner <dlechner@baylibre.com>, Guenter Roeck <groeck@chromium.org>, 
	Jagath Jog J <jagathjog1996@gmail.com>, Javier Carrasco <javier.carrasco.cruz@gmail.com>, 
	Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Jinseob Kim <kimjinseob88@gmail.com>, Jonathan Cameron <jic23@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Matti Vaittinen <mazziesaccount@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Remi Buisson <remi.buisson@tdk.com>, chrome-platform@lists.linux.dev, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bart Van Assche <bvanassche@acm.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 27 Oct 2026 at 17:14, Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Tue, Oct 27, 2026 at 02:49:54PM +0200, Rupesh Majhi wrote:
> > All of drivers/iio now builds without context analysis warnings, so
> > enable it in every Makefile that builds objects, replacing the entry
> > for dps310 alone.
>
> ...
>
> > +++ b/drivers/iio/Makefile
>
> > +CONTEXT_ANALYSIS := y
>
> Can we reduce the churn to only adding it here and do some magic to propagate
> this recursively, please? I truly believe it's feasible to achieve.

Should be:

subdir-ccflags-y += $(CFLAGS_CONTEXT_ANALYSIS)
