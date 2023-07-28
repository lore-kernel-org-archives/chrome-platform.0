Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D0AC2C0
	for <chrome-platform@lists.linux.dev>; Fri, 28 Jul 2023 07:44:05 +0000 (UTC)
Received: from [192.168.100.7] (unknown [59.103.217.95])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: usama.anjum)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 76EBE660704F;
	Fri, 28 Jul 2023 08:44:01 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1690530243;
	bh=5yC0SPVI3RI+4jj+ce7eMye7XQ5thMQfXfAF7lx7FLY=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=A73/1iYedZBvKV9gS3nqYCfwNqvpqBGdHDA/J8MIhhEi+bBLa2+nF0gPcEICTA427
	 dDVdIyZx98rtfd9oEPSnx182M/vS7sJdPW+e9zgrhQ2ck/sQNQMF05okPEZ4RcuiYA
	 TknTu9TI9QX+qIQWxd50yvZ+mA9aLjkpY4nWdjXapgiOKtacmcUTjY0h6bqEcDkYQm
	 JR3zNE6vwWeUsBdpZtNVuQCcUD5e+LsDEZ8Wj5IEqOLJIml53JLhoHXkdmyLJu95us
	 M9r1D/Ntg3z+qmwBjan83uN53wZjv3zvtSYRo0EbcCaFikKnpdNmZX3ineu45Azyom
	 ZoOizkHMdFWtw==
Message-ID: <331b4f97-388c-046a-d8b4-dd5bd45c9557@collabora.com>
Date: Fri, 28 Jul 2023 12:43:57 +0500
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Cc: Muhammad Usama Anjum <usama.anjum@collabora.com>, bleung@chromium.org,
 groeck@chromium.org, rafael@kernel.org, lenb@kernel.org,
 chrome-platform@lists.linux.dev, linux-acpi@vger.kernel.org,
 guillaume.tucker@collabora.com, denys.f@collabora.com,
 ricardo.canuelo@collabora.com
Subject: Re: [PATCH] platform/chrome: chromeos_acpi: use official HID GOOG0016
Content-Language: en-US
To: Tzung-Bi Shih <tzungbi@kernel.org>
References: <20230728014256.3836298-1-tzungbi@kernel.org>
 <fb9876f1-e729-f2d3-75d8-55fdae24e3ee@collabora.com>
 <ZMNg6NYSgTf3mIRJ@google.com>
From: Muhammad Usama Anjum <usama.anjum@collabora.com>
In-Reply-To: <ZMNg6NYSgTf3mIRJ@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 7/28/23 11:32 AM, Tzung-Bi Shih wrote:
> On Fri, Jul 28, 2023 at 10:59:22AM +0500, Muhammad Usama Anjum wrote:
>> On 7/28/23 6:42 AM, Tzung-Bi Shih wrote:
>>> Use official HID GOOG0016 for ChromeOS ACPI (see [1]).
>>>
>>> [1]: https://crrev.com/c/2266713
>>>
>>> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
>>> ---
>>> AFAIK, there has no ChromeOS devices using the driver yet.  Instead, they
>>> still stick to some downstream implementation.  IOW, I guess we are safe
>>> to just replace the PNP ID.
>> GOOG0016 got introduced in newer firmware. Older firmware will still have
>> only GGL0001 id. Lets keep both IDs otherwise the updated driver will not
>> work on older chromebooks. This can be easily achieved by keeping both IDs
>> in chromeos_device_ids.
> 
> Thanks for the review.  I overlooked the case.  Will fix it in next version.
> 
> So if I'm looking for the path, whether it bases on "GOOG0016" or "GGL0001",
> it actually depends on what firmware the system has?
So kernel will the match the firware's ID with list of IDs defined there.


-- 
BR,
Muhammad Usama Anjum
