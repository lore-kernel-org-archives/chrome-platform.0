Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D89B340D58A;
	Mon, 29 Jun 2026 02:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782701703; cv=none; b=jP32/G5oMVll6MfSkBTKMzyscE8jMcOv8lilnx2HKN1JNil0jdu0oO/6vGxbDV/7u2AcT6wR5JW8zTXpeAxVzKSGr8a2MM+ULv4eZRLrsP8JKD63kJzKuM6pVvdT8UNP1AjGW84wIRyoza75itb8CAec/LAy7DOkHX7u4DfBkCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782701703; c=relaxed/simple;
	bh=EavLWV+fQshO3DGkmM4KU/DsA+8+iIx29AvqAgsTjNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RsnHtOQqsvh6YE7sXSnXv8D7WmGG7Bb+4pqi4zoTEEHUgDMOnljpo7WZx5SgfJaWvXaImyZvhtI11YCowoUTD/4h3Khk+97KLr+zM5fVS98hRKoauGdQ50u0jQHwHvkEzJBqVr+2ySjybAa3RrwimGxpG5ss6TN0PEtrjuUn0Qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XffkLkh0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XffkLkh0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF2F21F000E9;
	Mon, 29 Jun 2026 02:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782701702;
	bh=D139c9TymHMx1zFEjt8YFIezPDK/6ZH0RIFJg2wbOqs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XffkLkh0doz+5hOR8lVqxXjta/6DQl44tNmZSnu4aA+yDzXKmPOkCnQNsRajp6XK1
	 JQsApif+RvpL4/XBpuW0uv8ANX3S6O8FzcGUpjAXcFED5eGWm4qCbcboPwd53MH4Pg
	 573Z2wy8qbqDQunDRR+EcbovuidCi1BjjXC2IA0AJyxyagkQre1qf70bb6tXVf3tx9
	 FS/hMC2Gz0rV2vyUC8o/IYoXH1YhJfFEq6v4uROoS53nRBxx4mXHusvX50g9cA6eqy
	 lDBF6PeQbWmlBdmh11s9mQHlsBrfv+nTmkYEdQ2x0icBZK75yov3FSzoHg5Wfn19z1
	 CcgQcI1xVqp/A==
Date: Mon, 29 Jun 2026 02:54:59 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Benson Leung <bleung@chromium.org>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>,
	Andrei Kuchynski <akuchynski@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Guenter Roeck <groeck@chromium.org>,
	Liao Yuanhong <liaoyuanhong@vivo.com>, Kees Cook <kees@kernel.org>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] platform/chrome: Drop unused assignment of
 platform_device_id driver data
Message-ID: <akHeg4wxvUiPpsKN@google.com>
References: <5b72bac661bdf1c874bea4b91ce3c2eccc84bba1.1781690554.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5b72bac661bdf1c874bea4b91ce3c2eccc84bba1.1781690554.git.u.kleine-koenig@baylibre.com>

On Wed, Jun 17, 2026 at 12:04:13PM +0200, Uwe Kleine-König (The Capable Hub) wrote:
> The drivers explicitly set the .driver_data member of struct
> platform_device_id to zero without relying on that value. Drop these
> unused assignments.
> 
> While touching these arrays use a single space in the list terminator
> consistently.
> 
> [...]

Applied to

    https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git for-next

[1/1] platform/chrome: Drop unused assignment of platform_device_id driver data
      commit: 200691f509fb77be78cd4b2d38b4e540a454bec3

Thanks!
