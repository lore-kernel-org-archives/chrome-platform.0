Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2526320E4
	for <chrome-platform@lists.linux.dev>; Fri, 10 Nov 2023 05:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kTbaD2G9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5C48C433CD;
	Fri, 10 Nov 2023 05:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699595869;
	bh=2/thsE8VetqAibMAzzhFVOgZBh0xwtrq6qPa9DCL+Eo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kTbaD2G9YsrVBFVDGQ5rvtAoCiaMYxJ65o2ddmy1z6WU4P1hLLyHeAJhcT/9SaCvE
	 +VmAVvRFnODJ5K1d3f9EzcyqOeAWw/nemuUv0KOAwEQbNj7Gf7Az9rDZSiZj8mSCJP
	 j+Wp6yxjw04YCqnT7rZAUWpHY//RKkZ4nGJUOh86uW0wlFHLJLSYRPGXyq5loxr+mp
	 LsC58N26XCAW7gPkGAVi1RFc6vzLP22Dspbr+nE4qqq00g7i51AJ3VqRnEvxHNibXa
	 d3lckb6SaSWvFzZPkdXcQTY32Lkr46scnonjHyv1ZWvSrabOaZnQoIqPPyIIfy2NbL
	 gZ6cMxBEnF/zA==
Date: Fri, 10 Nov 2023 13:57:46 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: bleung@chromium.org, groeck@chromium.org,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/7] platform/chrome: Implement quickselect for median
 calculation
Message-ID: <ZU3GWkKczNV-AQA4@google.com>
References: <20231109185439.1535962-1-visitorckw@gmail.com>
 <20231109185439.1535962-8-visitorckw@gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231109185439.1535962-8-visitorckw@gmail.com>

On Fri, Nov 10, 2023 at 02:54:39AM +0800, Kuan-Wei Chiu wrote:
>  /*
>   * cros_ec_sensor_ring_median: Gets median of an array of numbers
>   *
> - * For now it's implemented using an inefficient > O(n) sort then return
> - * the middle element. A more optimal method would be something like
> - * quickselect, but given that n = 64 we can probably live with it in the
> - * name of clarity.
> + * It's implemented using the quickselect algorithm, which achieves an
> + * average time complexity of O(n) the middle element. In the worst case,
> + * the runtime of quickselect could regress to O(n^2). To mitigate this,
> + * algorithms like median-of-medians exist, which can guarantee O(n) even
> + * in the worst case. However, these algorithms come with a higher
> + * overhead and are more complex to implement, making quickselect a
> + * pragmatic choice for our use case.

I am wondering if the patch helps given that n = 64.

>  static s64 cros_ec_sensor_ring_median(s64 *array, size_t length)
>  {
> -	sort(array, length, sizeof(s64), cros_ec_sensor_ring_median_cmp, NULL);
> -	return array[length / 2];
> +	const int k = length / 2;

`k` doesn't help readability.  Could you put `length / 2` to the code inline
or at least give it a better name.

> +	int lo = 0;
> +	int hi = length - 1;
> +
> +	while (lo <= hi) {
> +		int mid = lo + (hi - lo) / 2;
> +		int pivot, pivot_index;
> +		int i = lo - 1;

The be clear, I would prefer to initialize `i` when we really use it (i.e. at
the for-loop).

> +
> +		/* We employ the median-of-three rule to choose the pivot, mitigating

https://www.kernel.org/doc/html/latest/process/coding-style.html#commenting

> +		 * worst-case scenarios such as already sorted arrays and aiming to reduce
> +		 * the expected number of necessary comparisons. This strategy enhances the
> +		 * algorithm's performance and ensures a more balanced partitioning.
> +         */

$ ./scripts/checkpatch.pl --strict ...
ERROR: code indent should use tabs where possible
#284: FILE: drivers/platform/chrome/cros_ec_sensorhub_ring.c:171:
+         */$

> +		if (array[lo] > array[mid])
> +			cros_ec_sensor_ring_median_swap(&array[lo],
> +							&array[mid]);

It can fit into 100-column.

> +		if (array[lo] > array[hi])
> +			cros_ec_sensor_ring_median_swap(&array[lo], &array[hi]);
> +		if (array[mid] < array[hi])
> +			cros_ec_sensor_ring_median_swap(&array[mid],
> +							&array[hi]);

Ditto.

> +
> +		pivot = array[hi];
> +
> +		for (int j = lo; j < hi; j++)
> +			if (array[j] < pivot)
> +				cros_ec_sensor_ring_median_swap(&array[++i],
> +								&array[j]);

Ditto.

> +		cros_ec_sensor_ring_median_swap(&array[i + 1], &array[hi]);
> +		pivot_index = i + 1;
> +		if (pivot_index == k)
> +			return array[pivot_index];
> +		if (pivot_index > k)
> +			hi = pivot_index - 1;
> +		else
> +			lo = pivot_index + 1;

Add a comment and thus `pivot_index` can be eliminated.
