Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9EE93A2E28;
	Tue, 28 Jul 2026 10:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785233754; cv=none; b=Mm6s5/Zq4jCvrD7dSKZeXVcuQxzzXWhjTTk5cuX7gMZY89loVv8RBhexwswmQsGXxVEBRzAnZflH+pc+rQE0hqnjkDAqTsquvwvfd7qaUCmK500n5V4kscuLEvWKPpRcaURhQfbQZ6paKNIBY8RqJBKoYL0+mHMyROT1FRVl8K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785233754; c=relaxed/simple;
	bh=ncUvas+huM0gB+zOptF65rxYvSffp75mLI4ZKwlVb9c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bAQxEoGYOwZH4c1R85hQCJCgAYKcJeyEzLzj6EbzBjzslPSRYXYKgCYU0qccwf8dh7IDLvCRfVVTjR4q+sc1coTDvZ5M35+1lFr+JrYTXrPfXzWJ+v6TG7nu7rvltYDdS5KMHrIW3Hn1BZvj4Hxb2fQ1qOY9njoRQdWksHjgKu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bEKSQQeZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bEKSQQeZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D5271F000E9;
	Tue, 28 Jul 2026 10:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785233752;
	bh=S9VFrnX1dPKRuTzBtcds/DihVTXu0VewYMI5/zLkzqc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bEKSQQeZNoeN3JBJrmzt5mBP4DzkBt1n1k8UVM2kOBLZoKU8X9DcE590q1hcDO4ZP
	 iUuUjnIpLoPcf/EW65Po+E5TBREXxepSYDIZOocbP8D0IvgYlkRtESFv+b9tc8ML1a
	 gu3ZG4LGDlo8TlYKro26dijgxbDqKn9yKTeEe9rW9jKuxt7Sp/Z+F3UXBm09y4E/Bb
	 SWIRwbU8j9OyPxPS0EUeOea/soyat/rWOo94SMbXRCDbm2847Iv+aWRSCVrmCgoLoc
	 ZMn/3IDSiTzo6yjI5omMDoycc2CasLMMwjMCU/QM/9SDLz+URCbFGWAHS2rbW5m+1E
	 jnwBNz5pheknw==
Date: Tue, 28 Jul 2026 10:15:49 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Satyam Gupta <sgsatyam@google.com>
Cc: bleung@chromium.org, groeck@chromium.org,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	scollyer@google.com
Subject: Re: [PATCH v3] platform/chrome: cros_ec_sensorhub: Modify clock
 drift estimation
Message-ID: <amiBVdd1KvxbW5Ul@google.com>
References: <20260723163628.1695182-1-sgsatyam@google.com>
 <20260723163838.1698125-1-sgsatyam@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723163838.1698125-1-sgsatyam@google.com>

On Thu, Jul 23, 2026 at 04:38:38PM +0000, Satyam Gupta wrote:
> This CL makes 5 specific changes to the clock drift estimation algorithm

Since these are 5 distinct logical changes, shouldn't they be separated into
a 5-patch series?

> and timestamp filtering to resolve monotonic backward skews and OOO errors
                                                                  ^^^
Please spell out the acronym (i.e., Out Of Order) for clarity.

> during batching:
> 
> 1. Clamp the calculated drift slope (m) to a realistic maximum bound
>    (+/- 200 PPM). Huge jitter spikes previously produced astronomical

Same here: P..? Per Million?

> Signed-off-by: SATYAM GUPTA <sgsatyam@google.com>

Please fix the capitalization of your name to match the author line.

>  /*
>   * If we don't have any history entries for this long, empty the filter to
> - * make sure there are no big discontinuities.
> + * make sure there are no big discontinuities (e.g. after suspend or long idle).
> + *
> + * This is set to 2 seconds to accommodate normal batching flush intervals
> + * (which can be up to 1-2 seconds) without constantly resetting the filter,
> + * while still ensuring a reset occurs during actual long gaps or suspend.
>   */
> -#define TS_HISTORY_BORED_US 500000
> +#define TS_HISTORY_BORED_US 2000000 // 2 seconds
                                       ^^^^^^^^^^^^
The inline comment is redundant.

>  	/* Move everything over, also update offset to all absolute coords .*/
> -	for (i = state->history_len - 1; i >= 1; i--) {
> +	start = (state->history_len == CROS_EC_SENSORHUB_TS_HISTORY_SIZE) ?
> +		state->history_len - 1 : state->history_len;

How about:
    min_t(int, state->history_len, CROS_EC_SENSORHUB_TS_HISTORY_SIZE - 1);

> -static void
> +static bool
>  cros_ec_sensor_ring_check_for_past_timestamp(struct cros_ec_sensorhub
>  					     *sensorhub,
>  					     struct cros_ec_sensors_ring_sample

It'd be better to rename the function to make its intent clear.  E.g.:

    cros_ec_sensor_ring_is_past_timestamp()

And have it return true if it's a past timestamp, adjusting the caller
logic accordingly.

---

On a related note, is [1] still relevant?  Should we disregard it?

[1] https://lore.kernel.org/all/20260720110405.2127011-1-sgsatyam@google.com
