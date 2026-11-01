Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793530720;
	b=UOgX7rTLqXmyHU6LILCjAGc8cNPBAnLFSu1aotX8oqj3/j/BHqUeRylnHTGgp/pEXdES
	 OE0SCDTnqqi6jGCophCDgIhMOwbkAjRf2lB6JFG6nfuJEHtWfhg9b9r1xH3rC34VNebAg
	 m6jdNNrrRWBDYgbpKHWI8UUeTlTiGQ/KabJiht8FSLCNaWuIF6af+ONRavQL+mxrc9SNC
	 lyXSUAPpXe8PsNd3Dy6cEAPn8gneD+oY/Fc1l0AWRWfXvY6lP0q9tKoM2/vgudaXuOzbb
	 tB2ipvSpuUkEbQaed8SCRH2S3w5ISkA9Pm4jiOhlg7BjV3S9fMzK25lgiODLtyufXFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793530720;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BCy9FbfGCagGcVT1iVy5/qKWXuDsXeyd+T20CrEKRK8=;
	b=SUVwhilV4UDutbmnjeO57cOSLUHPs3JXgSs7h+B62K004+bEnHiF4XXgtWFAVXb8JbWt
	 MYSPJycWeVg4uaMvr6eiYoRkXRiMAHjePKGr9x4hcfp0C56blnPsA+PICC/LqmDs5yXcv
	 TsEt8tx5jnOGBvGzW+jXN9c3d0VlfGh3kDg731GV+ob83DPhVbie3i3DROal+EJiHFP3u
	 lyS8dLS8UHm5A8txE16lLxg+MP6eI8FdEHponL5gJrersN6umADhrHGxGMnxmn2/yd7s+
	 mCbwJfLdzzYBlRD958Od3icT/UuSULeDBGTRFzs+KQ5Ya2hhugD4LTwlpKRByl8x6PQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZfJvDPK3;
	arc=none smtp.remote-ip=209.85.208.177
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7C6606A326
	for <chrome-platform@lists.linux.dev>; Sun,  1 Nov 2026 10:58:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D7C6606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZfJvDPK3
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3ab4891fc73so20645641fa.0
        for <chrome-platform@lists.linux.dev>; Sun, 01 Nov 2026 02:58:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793530719; x=1794135519; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BCy9FbfGCagGcVT1iVy5/qKWXuDsXeyd+T20CrEKRK8=;
        b=ZfJvDPK31mpap7oX7TwEuJ5yIZMZdz4Apjti5M0jtCW0BI15oYGiFTZ5S5EdndWZqh
         6yA1OqGl6YX5w5vRcsLuTFiLLyq0RIpKUXgJW7VxOKNnhPi3CBefwTSDPA4mDsRfn2mm
         8LR1+G6JhpGerbYdIrS0rfj6IIa+9g4VxuJ/37ei9L3lK9kidglV7cueON11RVeTdjcW
         l7jC8yREIygF77RlV23VDNvXGj6pLjyuHj0yDIOZ5dgSv6r911qaloLDSYp6QvRg9l0C
         wlIREdzC2EK7Vuudb0B+JXVnQ0N/z2YPh+v8iccz/YlQqDGbZyNcYJGiFEt9IL3RtBtG
         oy+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793530719; x=1794135519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BCy9FbfGCagGcVT1iVy5/qKWXuDsXeyd+T20CrEKRK8=;
        b=WW690xVmWQr5muVxyb9YSr4bnjCS5tsvbyqVm70LTi6z7NiZ/O4qWT9wy8gOrzZZAk
         5xzIC+N1aCABck7TKlYW0pIFKJ4in5syaSmug+yN+/TXWZF1cpZ9TC115/ZNdUxv6RLP
         wA5+t2uTnqiR7bebyBh4fJOU1aEsDaL7QmTP8nnoB20wIHa8bT4MWDtCdB6qOkwtOIEU
         0g4sIJkZBHnVczzEJgG9WXvuRrbXQt/5ZBdjNtRryhuXO90M/tBYv5+45bbrX3fLc9Gt
         I9K2Dhbrw8dy+Whltzaeo//QvUKTKVNXGwHaEv7K/EtiIEqQiuhgccCJD4kLxeS+ZUiE
         7dnQ==
X-Forwarded-Encrypted: i=1; AKwUvBy85lBQPLdlyMH7FfkUM1YoEnVFhqP11vPYiQuP6+EEquWZDIe2vgOK2GdO68EUlbO13A0DqMG8en6DgXz+nEc=@lists.linux.dev
X-Gm-Message-State: AFq9FYK7QfSZKF5hdZFtDrKhkGA9OlZLafz3GLyd5025j8/hsgR1OYfi
	vqg5zFZf4Cgq+qZX+y2G7PNkzu8ON5Z8K3aND8WNqF0xSGpLWtyHhTGR
X-Gm-Gg: AYBFou25d3al+VHdYzE1bpLdnIn1WKHP+3ihA0S0sR/5ubwwZTHR5ptLMRoqSfNNKAC
	opKxDTSdgSTPhxDf/CZzO/8mBpgb5NulH8JOYgUBlUdbSB8axGDAFbH3N5Q4F1uXlZb1VibZanI
	Mnc0KvE0/oZ1RqySnzYKY8kMm3lCO6aYG4C4U/XrScVFZb/QuBJcFhHP9qKo0FewPwZ4dr9VAjs
	w+NR1zuiHmB4IPmRZtGO1RLMiCPey5tXR8hOQpqKG+sYAaMsuO9ZBhPxZoQp6hum3Q4sMmDQ7kN
	dYONe6AHS1mDNNQ7EviLnMW64jqIlZIDu/lhgCtTXx68gzZAonKOfcK0jX85rKLmjyq30dHooQI
	6ZvMu+I498sR2zmpPyTKnaofGpJiU5B2jtg4Zjg52W95hpJDqj/qUGD+fodZgA5i22YMd3K1PAK
	aJy/toZ7aCr1+QnMQjV9i+V6GjrWnHysTxXGXqijIJ3nRfoe3+8PESlNOE3SUKx/upMa6RarY/s
	jmmXWNHznuD6C+3rRUrTsKFTDv6QrZjSuBIP5bTz/cMnSPsw8el6l+hlR/LE5IJYoTYTz5bnsBp
	uLLJPFcu1NB0DAH8NqlIDYPRXvWNobK2VVds4aFLdID+Cq72pJtpQJbquR253GBzznzJpO14s1i
	cSOAKIfYwMMLXi/EYw9h/mRQMU+FwbPAcDDA+XQ==
X-Received: by 2002:a05:651c:1474:b0:3ac:330c:518c with SMTP id 38308e7fff4ca-3acb7a827f8mr15638971fa.19.1793530718404;
        Sun, 01 Nov 2026 02:58:38 -0800 (PST)
Received: from yantra.. (nekmmqtbv463r5fvgny-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:5462:a993:5223:791e])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acbbf1b726sm16613131fa.32.2026.11.01.02.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 02:58:38 -0800 (PST)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: jic23@kernel.org
Cc: Alex Lanzano <lanzano.alex@gmail.com>,
	Andy Shevchenko <andy@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	David Lechner <dlechner@baylibre.com>,
	Guenter Roeck <groeck@chromium.org>,
	Jagath Jog J <jagathjog1996@gmail.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Jinseob Kim <kimjinseob88@gmail.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Remi Buisson <remi.buisson@tdk.com>,
	chrome-platform@lists.linux.dev,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marco Elver <elver@google.com>,
	Bart Van Assche <bvanassche@acm.org>
Subject: Re: [PATCH v4 0/9] iio: enable context analysis for all drivers
Date: Sun,  1 Nov 2026 12:58:32 +0200
Message-ID: <20261101105832.55605-1-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261101033018.05897c08@jic23-hlaptop>
References: <20261027124954.110697-1-zoone.rupert@gmail.com> <20261101033018.05897c08@jic23-hlaptop>
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Post: <mailto:chrome-platform@lists.linux.dev>
List-Help: <mailto:chrome-platform+help@lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
List-Owner: <mailto:chrome-platform+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, 01 Nov 2026 03:30:18 +0000
Jonathan Cameron <jic23@kernel.org> wrote:

> Please take a look and check I didn't mess it up.

Diff is fine. Built drivers/iio with clang 23 allmodconfig: no
warnings, and a dropped unlock is still caught.

Subject line got lost though. It should be "iio: enable context
analysis for all drivers".

CONTEXT_ANALYSIS_dps310.o := y in pressure/Makefile can go now too.
I can send a follow-up.

Jinseob Kim's Tested-by didn't make it in:
https://lore.kernel.org/linux-iio/CALMSew+nhZp9BoqS5tOgFdiVy13U1r2f4UQa9Sd5zc9pSt_YcA@mail.gmail.com/

Rupesh
