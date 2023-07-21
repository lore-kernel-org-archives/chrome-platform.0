Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA5D27F25
	for <chrome-platform@lists.linux.dev>; Fri, 21 Jul 2023 15:11:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8B21C433C8;
	Fri, 21 Jul 2023 15:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689952302;
	bh=R0NhFhytJ7ntKMBnmoZsaLDFPS7OOg0XwxgrSgryfZs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IaY/CC9CHcS0AKIP12EvojQB3JHtnnHgSo6sS6QBUtZq/2bcEF/2S2QFUJdksYy5p
	 /gBv+ubGoXqxgeNnfCYkon4nZV13JjnP10+m8w3tYLnUzWo3at4qcoE8XkKL+SvfwA
	 mTwKzbFbkaBvVc8NOWhRgKHGPy450gaygZFm0xwmuUv+djG9zOjZ2CdY2Y5slc8C1Q
	 PIBg59QZy0jRH94b6jAg67YEwOjULAhlj2iXshb0/PxIOV2aGW9mywMRDsK5hN1pvm
	 nXGwvQdeTyTEkXdcr+6eAXhpw5nBLWkeNcoebRRz8KQ60P7/Zsb7e44V/vYiX7/Dqz
	 PXfL5fldCah9w==
Date: Fri, 21 Jul 2023 11:11:40 -0400
From: Sasha Levin <sashal@kernel.org>
To: Brian Norris <briannorris@chromium.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Rob Barnes <robbarnes@google.com>,
	Prashant Malani <pmalani@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, bleung@chromium.org,
	chrome-platform@lists.linux.dev
Subject: Re: [PATCH AUTOSEL 6.4 01/12] platform/chrome: cros_ec: Report EC
 panic as uevent
Message-ID: <ZLqgLDwKN+KngEAf@sashalap>
References: <20230702195057.1787686-1-sashal@kernel.org>
 <CA+ASDXMZ_ZnJfpsY-8ZRByiox8HCSZeY08MvGSpznLYBtVR1bw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+ASDXMZ_ZnJfpsY-8ZRByiox8HCSZeY08MvGSpznLYBtVR1bw@mail.gmail.com>

On Mon, Jul 10, 2023 at 03:46:21PM -0700, Brian Norris wrote:
>On Sun, Jul 2, 2023 at 12:51 PM Sasha Levin <sashal@kernel.org> wrote:
>>
>> From: Rob Barnes <robbarnes@google.com>
>>
>> [ Upstream commit 2cbf475a04b2ae3d722bbe41742e5d874a027fc3 ]
>>
>> Create a uevent when an EC panic is detected. This will allow udev rules
>> to trigger when a panic occurs. For example, a udev rule could be added to
>> capture an EC coredump. This approach avoids the need to stuff all the
>> processing into the driver.
>>
>> Signed-off-by: Rob Barnes <robbarnes@google.com>
>> Reviewed-by: Prashant Malani <pmalani@chromium.org>
>> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
>> Link: https://lore.kernel.org/r/20230509232624.3120347-1-robbarnes@google.com
>> Signed-off-by: Sasha Levin <sashal@kernel.org>
>> ---
>>  drivers/platform/chrome/cros_ec_lpc.c | 3 +++
>>  1 file changed, 3 insertions(+)
>
>What sorcery determined this was a valid for-linux-stable patch? It's
>a new feature, and definitely not a for-stable candidate. Please
>remove this from the queue.

Dropped, thanks.

-- 
Thanks,
Sasha
